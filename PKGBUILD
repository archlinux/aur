# Maintainer: Andrei Pavel <andrei.pavel@cti.pub.ro>
_gitrepository='bismuth'
_gitbranch='master'
pkgname='bismuth'
pkgver=2.0.0
pkgrel=0
pkgdesc='KDE Plasma extension that lets you tile your windows automatically'
arch=('i686' 'x86_64')
url="https://github.com/Bismuth-Forge/${_gitrepository}"
license=('MIT')
makedepends=('extra-cmake-modules' 'npm')
source=("git+https://github.com/Bismuth-Forge/${_gitrepository}.git#branch=${_gitbranch}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitrepository}"
  npm install
  chmod +x scripts/sysdep-install.sh
  npm run sysdep-install
  npm run bi-install
}
