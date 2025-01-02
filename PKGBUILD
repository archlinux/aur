# Maintainer: Danrus110 <danrus228zk@gmial.com>
pkgname=walcord
pkgver=2.9
pkgrel=4
pkgdesc="Pywal themes for Vesktop/Vencord/BetterDiscord"
arch=('any')
url="https://github.com/Danrus1100/walcord"
license=('MIT')
depends=('python' 'python-pip')
source=(https://github.com/Danrus1100/walcord/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('0872b963e41843a939beadb453868fd7fe010a266cbdb8226496783be7c62615')

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
