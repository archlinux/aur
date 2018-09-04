# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=terminus-terminal-bin
_pkgname=terminus
_pkgver=1.0.0
pkgver=1.0.0.54
pkgrel=1
alpha=54
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
sha256sums=('4157ca050e3ef02bbea317553f9abb2bb41dbcf372e42a5834471d9eb36cd424')

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
