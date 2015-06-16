# Maintainer: wicast <wicastchen at hotmail>

pkgname=go-gpm-local
pkgver=1.0.0.r0.ge366b07
pkgrel=1
pkgdesc="A GPM plugin to manage subpackages in the local package."
arch=("any")
url="https://github.com/technosophos/gpm-local"
license=('MIT')
groups=()
depends=("go-gpm")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/technosophos/gpm-local")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

#build() {
#  cd "$srcdir/${pkgname}"
#  ./configure --prefix=/usr
#}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm=775 "./bin/gpm-local" "${pkgdir}/usr/bin/go-gpm-local"
}
