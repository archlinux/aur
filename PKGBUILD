# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=easy-switcher
pkgver=0.4
pkgrel=1
pkgdesc="Keyboard layout switcher for Linux"
arch=(x86_64)
url="https://github.com/freemind001/$pkgname"
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(fpc)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('503244e4a704b48ffb5187249f2920f757169d27a5b2a29eac7e156b62e26a637ef092cb5466e1ff577d9650d2d7ffb0c791f1d28d1a0938b92598f192b4068f')
b2sums=('3d121bda6b9e6c5bb93e7fdef9eefcfb9054c34f723e9431b43a6f1283e1f55f55f28df5b9240c8b4c6b98d0a513ef50183fd58b7835dbbfbed6a05dfde64d55')

build() {
  cd $pkgname-$pkgver
  fpc $pkgname.lpr
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 $pkgname -t "$pkgdir"/usr/bin/
}
