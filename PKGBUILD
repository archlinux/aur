# Maintainer: Jack Random <jack at random dot to>
# former Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=buku-git
_pkgname=buku
pkgver=1114.fd49d30
pkgrel=1
pkgdesc="Powerful command-line bookmark manager."
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-requests' 'python-urllib3')
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
  install -Dm755 ${_pkgname}.py "${pkgdir}/usr/bin/${_pkgname}"
}

md5sums=('SKIP')
