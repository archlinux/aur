# Maintainer: wicast <wicastchen at hotmail>
# Contributor: Pablo Astigarraga <pote at tardis.com.uy>

pkgname=go-gpm-bootstrap
pkgver=0.0.1.r8.g8e79a7e
pkgrel=1
pkgdesc="A gpm plugin to kickstart your Go project's dependency versioning."
arch=("any")
url="https://github.com/pote/gpm-bootstrap"
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
source=("$pkgname::git+https://github.com/pote/gpm-bootstrap.git")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm=775 "./bin/gpm-bootstrap" "${pkgdir}/usr/bin/go-gpm-bootstrap"
}
