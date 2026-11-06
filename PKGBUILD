# Maintainer: chen-shuhan <2502820816@qq.com>
# Contributor: chen-shuhan <2502820816@qq.com>
# 非官方社区打包

_name=chinese-calendar
pkgname=python-chinese-calendar
pkgver=1.12.1
pkgrel=1
pkgdesc="Chinese calendar library for Python, 判断农历年是否有闰月、中国的法定节假日等 (非官方社区打包)"
arch=('any')
url="https://github.com/LKI/chinese-calendar"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer')
_srcname=${_name//-/_}
source=("https://files.pythonhosted.org/packages/4d/7b/f5f66c5d2d01610fc23a4619923d59d94523ef5c70b67c1aadb9234de05a/chinese_calendar-1.12.1.tar.gz")
sha256sums=('9355e6398cd360100fab75262971dd28e1ca61cac994ccb3768cfb84b77466fe')

build() {
  cd "$srcdir/${_srcname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_srcname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
