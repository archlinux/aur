# Maintainer: Alice Vega <aalicevegaa at proton mail dot com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmsysmon
pkgver=0.8.1
pkgrel=1
pkgdesc="A WindowMaker dock applet for system monitoring."
arch=('i686' 'x86_64')
url="https://github.com/voyageur/wmsysmon"
license=('GPL')
depends=('libxpm' 'libdockapp')
source=("https://github.com/voyageur/wmsysmon/archive/refs/tags/0.8.1.tar.gz")
md5sums=('3cd7e687f56608e70a90ed67803c68ff')

build() {
  cd "${pkgname}-${pkgver}/src"
  make
}
package() {
  cd "${pkgname}-${pkgver}/src"
  make DESTDIR="$pkgdir" install
  
  if [[ -f "README" ]]; then
	install -m 644 -D "README" "$pkgdir/usr/share/doc/$pkgname/README"
  fi
    
  if [[ -f "CHANGES" ]]; then
	install -m 644 -D "CHANGES" "$pkgdir/usr/share/doc/$pkgname/CHANGES"
  fi
    
  if [[ -f "COPYING" ]]; then
	install -m 644 -D "COPYING" "$pkgdir/usr/share/doc/$pkgname/COPYING"
  fi
}
