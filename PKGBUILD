# Maintainer: lalala <lalala_233@qq.com>

_name=aiocqhttp
pkgname=python-${_name}
pkgver=1.4.4
pkgrel=1
pkgdesc='A Python SDK with async I/O for CQHTTP (OneBot).'
url='https://aiocqhttp.nonebot.dev/'
arch=('any')
license=('MIT')
depends=('python-quart' 'python-httpx')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('eb2b6996753cacee45bf615aba5db4625b495e7a184a2fd27d2e5408f472c03d')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
