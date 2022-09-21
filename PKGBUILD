# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=mimi-git
_pkgname=mimi
pkgver=r117.ca08c8d
pkgrel=1
pkgdesc="Mantained fork of mimi, a minimal and lightweight xdg-open drop-in replacement most suitable for Window Manager users."
url='https://github.com/BachoSeven/mimi'
arch=('any')
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=('dmenu' 'libnotify')
source=("git+${url}.git")
md5sums=('SKIP')

provides=('xdg-utils')
conflicts=('xdg-utils')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Get the version number.
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
