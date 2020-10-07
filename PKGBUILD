# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

pkgname=praat-bin
pkgver=6.1.24
_debver=1
pkgrel=1
pkgdesc='Doing Phonetics by computer (speech analysis)'
url='http://www.praat.org/'
arch=('x86_64' 'i686')
license=('GPL')
depends=('alsa-lib' 'gtk2' 'libpulse' 'jack' 'ttf-charis-sil' 'ttf-sil-doulos')
optdepends=('ttf-sil-fonts')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_i686=("http://http.at.debian.org/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_$pkgver-${_debver}_i386.deb")
source_x86_64=("http://http.at.debian.org/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_$pkgver-${_debver}_amd64.deb")
sha256sums_x86_64=('dc1be1350cfbecae2fe61209d33f3c8fdf5c4db1a1a854ed2848453d440c0ad7')
sha256sums_i686=('85ddb2afd7b897dd50c0bda390f27e7bf39c73ff2c8c18883244f1d6ce317673')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
