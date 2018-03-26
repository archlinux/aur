# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Justin Settle <jus10 at partlycloudy dot org>

pkgname=ttf-caladea
pkgver=20130214
pkgrel=1
pkgdesc='Googles Caladea font'
arch=('any')
license=('Apache')
url='https://code.google.com/p/chromium/issues/detail?id=168879'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
provides=('ttf-font')
source=("${pkgname}-${pkgver}.tar.gz::http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/crosextrafonts-${pkgver}.tar.gz"
        "30-0-${pkgname#ttf-}.conf")
sha256sums=('c48d1c2fd613c9c06c959c34da7b8388059e2408d2bb19845dc3ed35f76e4d09'
            '5d6400972219d571b1d089607f89d1dbd3bc075a1ab0edf7c8554df169c12d4b')

package() {
  cd "crosextrafonts-${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -Dm0644 ../"30-0-${pkgname#ttf-}.conf" "${pkgdir}/etc/fonts/conf.avail/30-${pkgname#ttf-}.conf"
}
