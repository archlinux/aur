# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=persian-hm-ftx-fonts
pkgver=3.2
pkgrel=1
pkgdesc="A Persian font series derived from X Series 2, Metafont and FarsiTeX fonts with Kashida feature."
url="http://dma8hm1334.bitbucket.org/persian-hm-ftx/index.html"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-ftx' "$pkgname")
conflicts=('ttf-persian-hm-ftx' "$pkgname")
replaces=('ttf-persian-hm-ftx')
source=("https://bitbucket.org/dma8hm1334/persian-hm-ftx-$pkgver/downloads/persian-hm-ftx-$pkgver.7z")
sha256sums=('a1e7528c15723a3c28cede03d1df94fc809317d87fc4e69a90d69feb98a6c0fa')

package() {
  cd $srcdir/${pkgname%-fonts}-$pkgver
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
