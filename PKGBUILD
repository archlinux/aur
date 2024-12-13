# Maintainer: Danrus110 <danrus228zk@gmial.com>
pkgname=walcord
pkgver=2.7
pkgrel=2
pkgdesc="Pywal themes for Vesktop/Vencord/BetterDiscord"
arch=('any')
url="https://github.com/Danrus1100/walcord"
license=('MIT')
depends=('python' 'python-pip')
source=(https://github.com/Danrus1100/walcord/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('b71bd8be11b503315c29632cc89c5b11f662c38c9a1a1b5a0cb2cf4bcf0fa4cd')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m venv .venv
    source .venv/bin/activate
    pip install -r requirements-linux.txt --upgrade
    pyinstaller walcord.spec
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "dist/walcord" "$pkgdir/usr/bin/walcord"
}
