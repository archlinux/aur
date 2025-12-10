# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.7.0
pkgrel=1
pkgdesc="kew (/kjuː/) is a terminal music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL-2.0-only')
depends=('fftw' 'chafa' 'glib2' 'opus' 'opusfile' 'libvorbis' 'taglib' 'libogg' 'faad2')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9b81fdec0ffb1b3a3a9c251e3c807955050c80536a7745b6fdcc12aed04eee3b64f64822c0635d5c320490bc1a8a4863b6ea98f1809765211a44a6ee30a3990b')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" LANGDIRPREFIX="$pkgdir/usr" install
}
