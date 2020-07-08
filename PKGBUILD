# Maintainer: Leia <waste at mrtino dot eu>

pkgname=badwolf
pkgver=1.0.2
pkgrel=1
pkgdesc="A minimalist and privacy-oriented WebKit browser."
url="https://hacktivis.me/projects/badwolf"
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
#makedepends=('clang') # if you want to use clang instead of gcc, decomment this line and change CC=gcc to CC=clang in the build section
depends=('webkit2gtk')
source=("https://hacktivis.me/releases/$pkgname-$pkgver.tar.gz"
	"LICENSE")
sha512sums=('6c4e33adb62e13a5d6e878fc649d1e2764e0995db5b34a946a9b7aed2d85bb990248168b322801b7366a0d22ff8ae886092ca68f436f815ba2667ee13b13e4ea'
            '9a3b68429fc2267d596e08671330cc81f6d00ac7217a7a3991ebb583823a13e323108b514f5ec672c0982844ec581d9fed28dfede8fd92976b41d46b2924e140')
install=badwolf.install

#prepare() {
#  cd "$pkgname-${pkgver//_/-}"
#  # In order to be compliant with Arch Linux directory guidelines
#  patch -p1 -i "$srcdir/arch.patch"
#}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

