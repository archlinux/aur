# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=batmon.app
_pkgname=batmon
pkgrel=1
pkgver=0.8
pkgdesc="A battery monitor for laptops."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/batmon/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('fff2fc242ea2956f8b8c7eea751718c54d1a70026eb4659869ad1bac9f64dcff')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
