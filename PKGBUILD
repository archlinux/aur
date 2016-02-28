# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>

_pkgname=acbuild
pkgname=acbuild-git
pkgver=0.2.2
pkgrel=1
pkgdesc='Command line utility to build and modify App Container Images (ACIs), the container image format defined in the App Container (appc) spec.'
url='https://github.com/appc/acbuild'
license=('Apache')
arch=('i686' 'x86_64')
depends=('gnupg')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/appc/acbuild.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  ./build
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 bin/acbuild "$pkgdir/usr/bin/acbuild"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
