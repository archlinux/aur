# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Ota <otakar.trunecek@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: orelien <aurelien.foret@wanadoo.fr>

pkgname=gkleds
pkgver=0.8.2
pkgrel=4
pkgdesc="Gkrellm plugin to monitor the CapsLock, NumLock, and ScrollLock keys"
arch=(i686 x86_64)
source=("https://ftp.fau.de/gentoo/distfiles/96/${pkgname}-${pkgver}.tar.gz")
depends=('gkrellm' 'gtk2')
license=('GPL')
url="http://web.archive.org/web/20190209043134/http://freshmeat.sourceforge.net/projects/gkleds/"
md5sums=('140719ffcba3ff84b9b9c7c57b24fbff')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Ds src/.libs/gkleds.so "$pkgdir/usr/lib/gkrellm2/plugins/gkleds.so"
}
