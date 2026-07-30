# Maintainer: chen-shuhan <2502820816@qq.com>
# Contributor: chen-shuhan <2502820816@qq.com>

_name=chinese-calendar
pkgname=python-chinese-calendar
pkgver=1.11.0
pkgrel=1
pkgdesc="Chinese calendar library for Python, 判断农历年是否有闰月、中国的法定节假日等"
arch=('any')
url="https://github.com/LKI/chinese-calendar"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer')
_srcname=${_name//-/_}
source=("https://files.pythonhosted.org/packages/a0/af/d5dd356a7d03d17325a2f3100e35d26300a405bc7d57d3325dd634f04cc2/${_srcname}-${pkgver}.tar.gz")
sha256sums=('931d9187cbf7bb1dc09685dedb5013e74678bbe03a173d71d46b76afc37f2597')

build() {
  cd "$srcdir/${_srcname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_srcname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
