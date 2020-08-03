# Contributor: ShadowKyogre <shadowkyogre-ala-gmail.com>
# Maintainer: L.G. Sarmiento <Luis.Sarmiento-ala-nuclear.lu.se>
pkgname=artha
pkgver=1.0.5
pkgrel=1
pkgdesc='A free cross-platform English thesaurus based on WordNet'
arch=('i686' 'x86_64')
url="http://artha.sourceforge.net/wiki/index.php/Home"
license=('GPL')
depends=('wordnet-common' 'gtk2' 'dbus-glib')
optdepends=('enchant: spell checking support'
  'libnotify: notification support'
  'aspell-en: to show suggestion with aspell in English')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('5a0d568a5d5335f98b3a04180ec28de6ce280aa68d21036601e7f832dd3e990c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
#  msg 'patching the Makefile'
#  sed -i "200 s/LDFLAGS = /& -Wl,--copy-dt-needed-entries /g" src/Makefile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
