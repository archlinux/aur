# Maintainer: Danrus110 <danrus228zk@gmial.com>
pkgname=walcord
pkgver=2.9.1
pkgrel=5
pkgdesc="Pywal themes for Vesktop/Vencord/BetterDiscord"
arch=('any')
url="https://github.com/Danrus1100/walcord"
license=('MIT')
depends=('python' 'python-pip')
source=(https://github.com/Danrus1100/walcord/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('82eebca00823a4be2a9a1f03b39a595f3e85b8592d47b98f7327786030f42be7')

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
