# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Justin Settle <jus10 at partlycloudy dot org>

pkgname=ttf-carlito
pkgver=20130920
pkgrel=1
pkgdesc='Googles Carlito font'
arch=('any')
license=('custom:OFL')
url='https://code.google.com/p/chromium/issues/detail?id=280557'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
provides=('ttf-font')
source=("http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/crosextrafonts-${pkgname#ttf-}-${pkgver}.tar.gz"
        "30-0-${pkgname#ttf-}.conf")
sha256sums=('4bd12b6cbc321c1cf16da76e2c585c925ce956a08067ae6f6c64eff6ccfdaf5a'
            '9a7cd84293ec3d58bcd8da776d2eba6cd7a376e259f2fe617ce5f38bba808640')

package() {
  cd "crosextrafonts-${pkgname#ttf-}-${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm0644 ../"30-0-${pkgname#ttf-}.conf" "${pkgdir}/etc/fonts/conf.avail/30-${pkgname#ttf-}.conf"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
