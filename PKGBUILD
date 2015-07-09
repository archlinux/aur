# Maintainer: Ota <otakar.trunecek@gmail.com>
# Contributor: eric <eric@archlinux.org>
# Contributor: orelien <aurelien.foret@wanadoo.fr>

pkgname=gkleds
pkgver=0.8.2
pkgrel=2
pkgdesc="Gkrellm plugin to monitor the CapsLock, NumLock, and ScrollLock keys"
arch=(i686 x86_64)
source=("http://heim.ifi.uio.no/~oyvinha/files/files/$pkgname-$pkgver.tar.gz")
depends=('gkrellm' 'gtk2')
license=('GPL')
url="http://freshmeat.net/projects/gkleds/"
#url="http://heim.ifi.uio.no/~oyvinha/article.php?2.0.0"
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
