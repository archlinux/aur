# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-frontend-package
_name=${pkgname#python-}
pkgver=1.43.1
pkgrel=1
pkgdesc="Official front-end implementation of ComfyUI"
arch=('any')
url="https://github.com/Comfy-Org/ComfyUI_frontend/"
license=('GPL-3.0')
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('2c69413e79aa2a2af8ec971a723f6d1dda590bac7e7b424e6c5645411c9a1da5221a681ad6cea0e2757d929f48e87442b051c84181b2b5bdb46a3699211f84e7')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
