# Maintainer: David Beley <dbeley@protonmail.com>
pkgname=lastfm_cg-git
pkgver=1.3
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Lastfm Collage Generator"
arch=('any')
url="https://github.com/dbeley/${pkgname%-git}"
license=('MIT')
depends=(
        'python'
        'python-setuptools'
        'python-pillow'
        'python-numpy'
        'python-pylast'
        'python-requests'
        'python-requests-cache'
        )
source=("git+https://github.com/dbeley/${pkgname%-git}")
md5sums=("SKIP")

package() {
  cd "${pkgname%-git}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
