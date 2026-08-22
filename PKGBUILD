# Maintainer: liqoxowz <hoswt4s3321399@gmail.com>

pkgname=python-jpholiday
pkgver=1.0.3
pkgrel=1
pkgdesc="日本の祝日を取得するライブラリ"
arch=('any')
url="https://github.com/Lalcs/jpholiday"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-poetry-dynamic-versioning')

source=("https://files.pythonhosted.org/packages/source/j/jpholiday/jpholiday-${pkgver}.tar.gz")
sha256sums=('d5a56592fd6a7ceb76d49e1c5f1af806223e0d5d6b9e3bc5477860e6605f4cab')

build() {
    cd "jpholiday-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "jpholiday-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
