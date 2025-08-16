# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
#Contributor : fpaskali <paskali2005 at gmail>

pkgname=burgerspace
pkgver=1.10.0
pkgrel=2
pkgdesc="A hamburger-smashing video game"
arch=('any')
url="http://gvlsywt.cluster051.hosting.ovh.net/dev/burgerspace.html"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_mixer' 'sdl2_gfx' 'libflatzebra')
source=("http://gvlsywt.cluster051.hosting.ovh.net/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7ce6fa48829414ff7a48cb038b87842112c18829769105f34a842bffcfe99072ed6201ba3772f98efd115b8ffd9de0d1d15dc9f8b80a5f978f5763b72a358d8c')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
