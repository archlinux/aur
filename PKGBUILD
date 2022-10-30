# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=protondb-tags
_pkgname=ProtonDB-Tags
pkgver=1.2.2
pkgrel=1
pkgdesc="Pull ratings from ProtonDB and import them into your Steam library as tags."
arch=('any')
url="https://github.com/CorruptComputer/$_pkgname"
license=('MIT')
depends=(
    'python-vdf'
    'python-requests'
)
optdepends=(
    'steam: Supports any steam, native, flatpak, etc'
)
provides=('protondb-tags')
source=(https://github.com/CorruptComputer/$_pkgname/archive/$pkgver.zip)
sha512sums=('f9668a2a1fc815c720ee3333f2dc53d4fc7c36198c31b710b58a43e519885796565a1b3406c24c757a720f74b05d49060635c9f8b144b83824e5d19342a457b0')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    
    install -Dm755 $_pkgname.py "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
