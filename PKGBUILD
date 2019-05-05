# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=ttyplot
pkgver=1.4
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
sha256sums=('11974754981406d19cfa16865b59770faaf3ade8d909d9a0134dc56e00d29bd4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

