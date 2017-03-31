# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

pkgname=python-azkaban
pkgver=0.9.6
pkgrel=1
pkgdesc="Lightweight Azkaban client"
arch=('any')
url="https://github.com/mtth/azkaban"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/a/azkaban/azkaban-$pkgver.tar.gz")

package() {
    cd "$srcdir"/azkaban-$pkgver
    python setup.py install --root="$pkgdir" -O1
    chmod o+r "$pkgdir/usr/lib/python3.6/site-packages/azkaban-$pkgver-py3.6.egg-info/"*
    install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('79ded11b2b59598228a7a827f3b4784d13cea5e16c57f3548c81595524d9f99f')
