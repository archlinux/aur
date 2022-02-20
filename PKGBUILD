# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.25.0
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
sha256sums=('e9ec71b76b89df66b0b025e363d4a54007b75030e476036e297e95600c2c0f24')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
