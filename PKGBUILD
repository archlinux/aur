pkgname=yay-faster-cn
pkgver=0.3
pkgrel="4"
pkgdesc="Use mirrors to speed yay up in China."
arch=('any')
url="https://github.com/iamzhz/yay-faster-cn"
license=('MIT')


depends=('python' 'python-setuptools' 'git' 'wget' 'yay')
makedepends=('python-setuptools')


source=("https://github.com/iamzhz/yay-faster-cn/releases/download/week_version/yay_faster_cn_v${pkgver}.tar.gz")
sha256sums=('ad33dfe8672ae1ea2c23d376457fcc6560bd2399b0771121d1c57f79a228ba0c')

build() {
  cd "yay_faster_cn_v$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "yay_faster_cn_v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}