# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

# To bump, a build has to be available here:
# http://http.at.debian.org/debian/pool/main/p/praat/

pkgname=praat-bin
pkgver=6.2.04
_debver=1
pkgrel=1
pkgdesc='Doing Phonetics by computer (speech analysis)'
url='http://www.praat.org/'
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
source=("http://http.at.debian.org/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_$pkgver-${_debver}_amd64.deb")
sha256sums=('cec81ba112c30a8b792777430248da19befb409f9275a1555b5542d125e077b2')

prepare() {
	bsdtar -xf data.tar.xz
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
