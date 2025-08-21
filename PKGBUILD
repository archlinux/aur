# Maintainer: Ja4e <Jakie101@proton.me>
pkgname=lyrus-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A python lyrics player for cmus"
arch=('any')
url="https://github.com/Ja4e/Lyrus"
license=('MIT')

depends=(
    'python'
    'python-requests'
    'python-aiohttp'
    'python-wcwidth'
    'python-appdirs'
    'python-syncedlyrics'
)

optdepends=(
    'python-mpd2: optional mpd support'
)

makedepends=('git')
provides=("lyrus")
conflicts=("lyrus")
source=("lyrus::git+https://github.com/Ja4e/Lyrus.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/lyrus" || return 1
    install -Dm755 "lyrus.py" "$pkgdir/usr/bin/lyrus"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}

