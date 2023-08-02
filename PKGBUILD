# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.3.2
pkgrel=1
pkgdesc="A tempo measurement tool for composers and musicians"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/dqpb/gmetronome"
license=('GPL3')
depends=(
    'gtkmm3'
    'libpulse'
    'alsa-lib'
)

source=(
    "https://gitlab.gnome.org/dqpb/gmetronome/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.bz2"
)
sha256sums=(
    '0429e878a1b514903b346fe647d3964e6842dd6d9ed93456ac848591e0d0dade'
)

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --with-pulseaudio --with-alsa
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
