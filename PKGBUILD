# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=ngpost
pkgver=4.16
pkgrel=1
pkgdesc="Command line and GUI Usenet poster"
arch=('x86_64')
url="https://github.com/mbruel/ngPost"
license=('GPL-3.0-only')
depends=('qt6-base')
optdepends=('par2cmdline: par2 creation'
            'parpar: faster par2 creation'
            'rar: archive uploads using rar'
            '7zip: archive uploads using 7zip')
source=("ngPost-$pkgver.tar.gz::https://github.com/mbruel/ngPost/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c8a3e8ce1a23b2a6d3aa978c191c588c4fbe7b53197cb6a8f48884fbdf805e2')

build() {
    cd ngPost-$pkgver/src
    qmake6
    make
}

package() {
    install -Dm755 ngPost-$pkgver/src/ngPost $pkgdir/usr/bin/ngPost
    install -Dm644 ngPost-$pkgver/ngPost.desktop $pkgdir/usr/share/applications/ngPost.desktop
    install -Dm644 ngPost-$pkgver/src/resources/icons/ngPost.png $pkgdir/usr/share/pixmaps/ngPost.png
}

