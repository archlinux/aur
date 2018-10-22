# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ams-lv2
pkgver=1.2.1
pkgrel=1
pkgdesc="A port of the internal modules found in Alsa Modular Synth"
arch=('x86_64')
url="https://github.com/blablack/ams-lv2"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('fftw' 'gtkmm')
makedepends=('lv2' 'lvtk' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('216435bfc8620f7138791243dee60c27f7e3a38b972dcaba4150a47e1d8d53cec807246ace658b5136b45c43fd7e533df49f8b9bce8d40dc9d148121b9388886')

build() {
  cd "$pkgname-$pkgver"
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"
}
