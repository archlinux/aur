# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal
_pkgname=terminus
_pkgver=1.0.0
pkgver=1.0.0.37
pkgrel=2
alpha=37
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/terminus"
license=('MIT')
depends=('nodejs')
#makedepends=('git' 'npm' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("terminus-terminal")
conflicts=("terminus-terminal")
replaces=('terminus-terminal')
source=("$url/releases/download/v${_pkgver}-alpha.$alpha/${_pkgname}_${_pkgver}-alpha.${alpha}_amd64.deb")
sha256sums=('685c4215b399e221f902faa765423ecf7342598c1f997dc6d8b15f69a1c67550')

pkgver(){
  echo ${_pkgver}.${alpha}
}
package() {
  cd "$srcdir/"
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir

 install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Terminus/terminus

END

}
