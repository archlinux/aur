# Maintainer: heitzmann <heitzmann@gmail.com>
pkgname=python-toptica-lasersdk
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="Easy control of TOPTICA laser products using Python"
arch=('any')
url="https://www.gnu.org/software/patch/patch.html"
license=('MIT')
depends=('python-pyserial')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
sha256sums=('d42b7013d751b5517b75b1a60189812dc2aefd9ff086de383bb631f6870f6c75')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  #python -O -m compileall "${pkgdir}/usr/lib"
}
