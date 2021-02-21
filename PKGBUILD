# Maintainer : David Beley <dbeley@protonmail.com>
pkgname=youtube_extract-git
pkgver=1.3.7
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Extract metadata for all videos from a youtube channel into a csv file."
arch=('any')
url="https://github.com/dbeley/${pkgname%-git}"
license=('MIT')
depends=(
        'python'
        'python-setuptools'
        'youtube-dl'
        'python-pandas'
        'python-openpyxl'
        )
source=("git+https://github.com/dbeley/${pkgname%-git}")
md5sums=("SKIP")

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
