# Contributor: SZanko szanko at protonmail dot com

pkgname=python-benedict
pkgver=0.35.0
pkgrel=1
pkgdesc="dict subclass with keylist/keypath support, I/O shortcuts (base64, csv, json, pickle, plist, query-string, toml, xml, yaml) and many utilities."
arch=('any')
url="https://github.com/fabiocaccamo/python-benedict"
license=('MIT')
depends=(
	'python'
	'python-beautifulsoup4'
	'python-boto3'
	'python-ftfy'
	'python-mailchecker'
	'python-phonenumbers'
	'python-dateutil'
	'python-fsutil'
	'python-openpyxl'
	'python-slugify'
	'python-toml'
	'python-xlrd'
	'python-xmltodict'
	'python-useful-types'
	'python-typing_extensions'
	'python-yaml'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(
	'93a0fda49d817cc92c7c72fa6ab29b9581f5bc86e8e4892069e730304bd3d180'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
