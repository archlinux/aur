# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
# Contributor: <agustinballesteros04@gmail.com>
pkgname=kew
pkgver=3.7.1
pkgrel=1
pkgdesc="Music for the Shell."
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL-2.0-only')
depends=('fftw' 'chafa' 'glib2' 'opus' 'opusfile' 'libvorbis' 'taglib' 'libogg' 'faad2')
replaces=('cue-music-command')
conflicts=('kew-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('35e78138790acb2a8e21522f378d719e8f894a5d928730887e468fb61a0e74c637e4a12fa8cc1cd15aa33486bd9f32c43c9964c38bc60f501d4e02d2d5418eac')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" LANGDIRPREFIX="$pkgdir/usr" install
}
