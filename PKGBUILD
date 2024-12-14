# Maintainer: Danrus110 <danrus228zk@gmial.com>
pkgname=walcord
pkgver=2.8
pkgrel=3
pkgdesc="Pywal themes for Vesktop/Vencord/BetterDiscord"
arch=('any')
url="https://github.com/Danrus1100/walcord"
license=('MIT')
depends=('python' 'python-pip')
source=(https://github.com/Danrus1100/walcord/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('42a10b9b1d14810a49e281f26083d64fad791cf1a88894038a953f3a1829d400')

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
