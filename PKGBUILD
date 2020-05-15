# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

pkgname=praat-bin
pkgver=6.1.14
_debver=3
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
sha256sums_x86_64=('2a68ce8dc356bc86212068a9fe41942eb841631b33119c1ea3c2e5734c294830')
sha256sums_i686=('b39bd646bc245dc8231c5604a3d1bb9b086898ef2231e01b26c2268ade2da45f')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
