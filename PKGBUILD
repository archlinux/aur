# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=ttyplot
pkgver=1.1
pkgrel=1
pkgdesc='A realtime plotting utility for terminal with data input from stdin'
arch=('x86_64')
url='https://github.com/tenox7/ttyplot'
license=('custom:The Unlicense')
depends=('ncurses')
makedepends=('make' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/tenox7/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('56c4c9343d5da99a23e020e8c37f7f02178cd370983d602cd146f2bb67b0a155')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

