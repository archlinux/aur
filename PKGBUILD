# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

# To bump, a build has to be available here:
# http://http.at.debian.org/debian/pool/main/p/praat/

pkgname=praat-bin
pkgver=6.3.14
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
sha256sums=('993de91f07fcc698eaa661e64de36f0a0bce4cd03772a164d668b282d6b9e5a9')

prepare() {
	bsdtar -xf data.tar.xz
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
