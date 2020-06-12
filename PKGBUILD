# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

pkgname=praat-bin
pkgver=6.1.16
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
sha256sums_x86_64=('1967415839db021d335e4906334e0b909913a62071c368f6aab4959ec5ba7307')
sha256sums_i686=('e25b73bff493a56b0875dd378b947ff0b1b0263963a8200e21d231f4e5d7fdc5')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
