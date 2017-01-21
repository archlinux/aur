# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=persian-hm-xs2-fonts
pkgver=3.2
pkgrel=1
pkgdesc="A Persian font series derived from X Series 2 fonts with Kashida feature."
url="http://dma8hm1334.bitbucket.org/persian-hm-xs2/index.html"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-ftx' "$pkgname")
conflicts=('ttf-persian-hm-ftx' "$pkgname")
replaces=('ttf-persian-hm-ftx')
source=("https://bitbucket.org/dma8hm1334/persian-hm-xs2-$pkgver/downloads/persian-hm-xs2-$pkgver.7z")
sha256sums=('e87d8c25f1c36bca8605a4cee42056d8a76da7bab9cc898408565874e492fe62')

package() {
  cd $srcdir/${pkgname%-fonts}-$pkgver
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
