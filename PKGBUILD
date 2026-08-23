# Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=python-ctkcolorpicker
_pkgname=CTkColorPicker
pkgver=0.9.0
pkgrel=1
pkgdesc="Modern color picker widget for CustomTkinter"
arch=('any')
url="https://github.com/Akascape/CTkColorPicker"
license=('CC0-1.0')
depends=('python-customtkinter' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5f65e35d0cf9d0c9fee7e24f3f460e256641f0e335ab00c17425bb0d16060b0c')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
