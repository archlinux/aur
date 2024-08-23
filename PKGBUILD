# Maintainer: Sving1024 <piano5432@outlook.com>
_name=accesser
pkgname=python-${_name}
pkgver=0.9.4
pkgrel=1
arch=('any')
pkgdesc="A tool for solving SNI RST"
url="https://github.com/URenko/Accesser"
license=('GPL-3.0-or-later')
depends=(
	'python'
	'python-packaging'
    'python-cryptography'
    'python-tld'
    'python-tomli'
    'python-dnspython'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
optdepends=(
    'python-rich'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('4e164790f71b5794856fdc12a80284897a7afe8bef96a8735d115881a98585b2')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
