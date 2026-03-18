# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# remove this #
_upstreamver='1.0.0'
_upstrejjkamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='textual-fspicker'

pkgname="python-textual-fspicker"
_pkgname=${pkgname#python-}
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple Textual filesystem picker dialog library"
arch=('any')
url='https://github.com/davep/textual-fspicker'
license=('MIT')
depends=('python' 'python-textual')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-uv-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('29f1e75e655999dad87c8d680a32b7ff412b1e54c1cc85a99d50ba8730870f41')


build() {
    cd ""$_pkgname-$pkgver""

	python -m build --wheel --no-isolation
}

package() {
    cd ""$_pkgname-$pkgver""

	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
