# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=python-ttf2web
_name="ttf2web"
pkgver=0.9.3
pkgrel=1
pkgdesc="Optimize fonts to only the specific glyphs needed for your text and website "
arch=(any)
url="https://github.com/johncf/ttf2web"
license=('MIT')
depends=(
  python
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('034ed2c00ad663a8f57625e13de6398b9feeafd71e19a03295de431f9ee93748')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}/"
}
