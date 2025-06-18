# Maintainer: Reddiepoint <erqqvrcbvag.nepu@tznvy.pbz> (rot13)
pkgname="discordo-launcher"
pkgver=0.1.0
pkgrel=3
pkgdesc="A simple CLI tool for managing multiple Discord accounts with discordo."
arch=('x86_64')
license=('GPL-3.0')
url="https://github.com/Reddiepoint/discordo-launcher"
depends=('org.freedesktop.secrets' 'libsecret' 'discordo')
makedepends=('rust' 'git')
source=("git+https://github.com/Reddiepoint/discordo-launcher.git#tag=v${pkgver}")
#source=("git+file://${PWD}")
options=(!debug)
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

