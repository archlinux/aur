# Maintainer: Danrus110 <danrus228zk@gmial.com>
pkgname=walcord
pkgver=2.6
pkgrel=1
pkgdesc="Pywal themes for Vesktop/Vencord/BetterDiscord"
arch=('any')
url="https://github.com/Danrus1100/walcord"
license=('MIT')
depends=('python' 'python-pip')
source=(https://github.com/Danrus1100/walcord/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('48b682b2fef113ba486f76f704f5f4dfda6eb3174082694de24c654fc8c7a950')

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