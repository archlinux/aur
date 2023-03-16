# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

# To bump, a build has to be available here:
# http://http.at.debian.org/debian/pool/main/p/praat/

pkgname=praat-bin
pkgver=6.3.09
_debver=1
pkgrel=1
pkgdesc='Doing Phonetics by computer (speech analysis)'
url=https://www.fon.hum.uva.nl/praat/
arch=(x86_64)
license=(GPL)
depends=(alsa-lib
         gtk2
         jack
         libpulse
         ttf-charis-sil
         ttf-sil-doulos)
optdepends=(ttf-sil-fonts)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://debian.charite.de/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_$pkgver-${_debver}_amd64.deb")
sha256sums=('8c1235199c10bd88706142ed484c9756ef2ace15dde7263d03b85f7bee629f9c')

prepare() {
	bsdtar -xf data.tar.xz
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
