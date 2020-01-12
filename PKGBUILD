# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Victor Engmark <victor.engmark@gmail.com>

pkgname=python-vcard
_name="${pkgname#*-}"
pkgver=0.13.0
pkgrel=1
pkgdesc="vCard validator"
arch=('any')
url='https://gitlab.com/victor-engmark/vcard'
license=('GPL3')
depends=('python' 'python-isodate')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('0b8a7d8873d26d2a99fb38acd2970018d874ec1ecefcf202da0e2ed2e282b5cb43d0b53717873d29c62c0c72748278929db9562308f6503792271fe42f915ce3')


build() {
	cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
