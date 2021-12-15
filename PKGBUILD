# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: rmanne <rahul_manne@hotmail.com>

# See Debian packaging for details, rules and control files linked here:
# https://tracker.debian.org/pkg/praat

# To bump, a build has to be available here:
# http://http.at.debian.org/debian/pool/main/p/praat/

pkgname=praat-bin
pkgver=6.2.03
_debver=1
pkgrel=1
pkgdesc='Doing Phonetics by computer (speech analysis)'
url='http://www.praat.org/'
arch=(x86_64)
license=(GPL)
depends=(alsa-lib gtk2 libpulse jack ttf-charis-sil ttf-sil-doulos)
optdepends=(ttf-sil-fonts)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("http://http.at.debian.org/debian/pool/main/p/${pkgname%-bin}/${pkgname%-bin}_$pkgver-${_debver}_amd64.deb")
sha256sums=('c8abeecb44c68d01bed8c5197e6589a01f909d13b8d181d5a2239257cdb610fe')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
