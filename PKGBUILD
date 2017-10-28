# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=persian-hm-ftx-fonts
pkgver=3.3
pkgrel=1
pkgdesc="A Persian font series derived from X Series 2, Metafont and FarsiTeX fonts with Kashida feature."
url="https://bitbucket.org/dma8hm1334"
arch=(any)
license=('custom:OFL')
depends=('fontconfig')
provides=('ttf-persian-hm-ftx')
conflicts=('ttf-persian-hm-ftx')
source=("${url}/persian-hm-ftx-${pkgver}/downloads/persian-hm-ftx-${pkgver}.7z")
sha256sums=('fd70b592d138e0a4cd9f2eaf27073e6ef204b77797392db1120d245a35e4d375')

package() {
  cd $srcdir/${pkgname%-fonts}-$pkgver
  install -d "${pkgdir}/usr/share/fonts/${pkgname%-fonts}"
  install -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./fonts/Ttf/*.ttf
  install -Dm644 ./OFL.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
