# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal-bin
_pkgname=terminus
_pkgver=1.0.0
pkgver=1.0.0.52
pkgrel=1
alpha=52
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/terminus"
license=('MIT')
depends=('nodejs')
#makedepends=('git' 'npm' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("terminus-terminal")
conflicts=("terminus-terminal")
replaces=('terminus-terminal')
source=("$url/releases/download/v${_pkgver}-alpha.${alpha}/${_pkgname}-${_pkgver}-alpha.${alpha}-linux-amd64.deb")
sha256sums=('2975abad1580c1a0d0915dbe7ad0e836344ddd2245045e55d1fb8a2637e04e2e')

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
