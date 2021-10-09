# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.24.3
pkgrel=1
pkgdesc="dict subclass with keylist/keypath support, I/O shortcuts (base64, csv, json, pickle, plist, query-string, toml, xml, yaml) and many utilities."
arch=('any')
url="https://github.com/fabiocaccamo/python-benedict"
license=('MIT')
depends=(
	'python'
	'python-ftfy'
	'python-mailchecker'
	'python-phonenumbers'
	'python-dateutil'
	'python-fsutil'
	'python-slugify'
	'python-pyaml'
	'python-requests'
	'python-six'
	'python-toml'
	'python-xmltodict'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8019a77bd73ae1127bcf6b79b82b6dc323cf1ae67bfb5e2ff59dbbdeb052005d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
