# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

pkgname=praat-bin
pkgver=6.1.11
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
sha256sums_x86_64=('93ca8b20b6a0e9685e22dac214589d854c25ed56e98d71998c51cb05b2b6970e')
sha256sums_i686=('addd297570631cec1f23a299729094a8750dac0cbc16cc564ac2007511696926')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
