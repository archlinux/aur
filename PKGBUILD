# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=reolink_aio
pkgver=0.20.0
pkgrel=1
pkgdesc='Reolink NVR/camera API PyPI package.'
arch=('any')
url='https://github.com/starkillerOG/reolink_aio/'
license=('LGPL-3.0-only')
depends=('python' 'python-aiohttp' 'python-aiortsp' 'python-orjson'
         'python-pycryptodomex' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('0572b9bae02bb364e18ae424acf6a41d2985c2529667011a434cb6799ed039822415d794501b71146ff56d06ec668bf6b4ad89400edb6a1995f6f77d77b37110')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
