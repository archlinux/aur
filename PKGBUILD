# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=buku-git
_pkgname=buku
pkgver=556.0fec5de
pkgrel=1
pkgdesc="cmdline bookmark management utility written in Python3 and SQLite3"
arch=('any')
depends=('python' 'python-crypto' 'sqlite')
conflicts=('buku')
provides=('buku')
makedepends=('make')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=('git+https://github.com/jarun/buku.git')

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

md5sums=('SKIP')
