# Maintainer: David Runge <dave@sleepmap.de>
pkgname=deteriorate-lv2
pkgver=1.0.6
pkgrel=1
pkgdesc="A set of plugins to deteriorate the sound quality of a live input"
arch=('x86_64')
url="https://objectivewave.wordpress.com/deteriorate-lv2/"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gtkmm')
makedepends=('lv2' 'lvtk' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('81580c47ee8ed6d730a87f36b35646c9')

build() {
  cd "$pkgname-$pkgver"
  python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd "$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
