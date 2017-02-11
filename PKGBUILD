# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=broom
pkgver=1.6.0
pkgrel=1
pkgdesc="A disk cleaning utility for developers."
arch=(any)
url="https://github.com/nicoulaj/broom"
license=(MIT)
depends=(make perl)
depends=('bash>=4' ncurses)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://github.com/nicoulaj/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b82a814cea04afa4d7419f4def843a97')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" || return 1
}
