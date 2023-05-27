# Maintainer: dqpb <dqpb@mailbox.org>

pkgname=gmetronome
pkgver=0.2.2
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
    '4e4786ac1cca626c7251668aad8680bc5627544a0ccd77d6a99e98992d192bc9'
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
