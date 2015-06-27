# Contributor: Robert Schwarz <mail@rschwarz.net>
pkgname=fishnpitch-git
pkgver=2010.01.28.4168095
pkgrel=1
pkgdesc="a JACK MIDI real-time tuner"
arch=('i686' 'x86_64')
url="https://github.com/leethargo/fishnpitch"
license=('GPL3')
depends=('jack-audio-connection-kit')
makedepends=('jack-audio-connection-kit')
provides=(fishnpitch)
conflicts=(fishnpitch)
source=("$pkgname"::"git://github.com/leethargo/fishnpitch.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git log -1 --format="%cd.%h" --date=short | sed 's/-/./g'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    mkdir -p ${pkgdir}/usr/bin
    cp fishnpitch ${pkgdir}/usr/bin
} 
