# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=ttyplot
pkgver=1.2
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
sha256sums=('3ced72e59c74655539dddcf570a4c14fda3460a042cd2297bf1914cd9efab2c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

