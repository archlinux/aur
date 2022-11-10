# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=rfc3339
pkgname=python-$_name
pkgver=6.2
pkgrel=1
pkgdesc='Format dates according to the RFC 3339.'
arch=(any)
url='https://hg.sr.ht/~henryprecheur/rfc3339'
license=('ISCL')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('753577b34e443b76e70dbcdeb6b4487dceac63909d646898faed796b526954fb7180f3b622d47bcc5d203e5268c3f277d704af97539500b95c0fab934ad44793')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
