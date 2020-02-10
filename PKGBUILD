# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=dayplanner
pkgver=0.11
pkgrel=2
pkgdesc="A simple time manager"
arch=('i686' 'x86_64')
url="http://www.day-planner.org/"
license=('GPL3')
depends=('desktop-file-utils' 'gtk2-perl' 'perl-date-holidayparser')
optdepends=(
  'perl-gtk2-trayicon: system tray icon plugin'
  'perl-locale-gettext: internationalization'
  'perl-io-socket-ssl: synchronization'
)
makedepends=('cpanminus' 'perl-locale-gettext')
install="${pkgname}.install"
source=(
  "https://gitlab.com/zerodogg/dayplanner/-/archive/${pkgver}/dayplanner-${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
sha256sums=('b5d9a8fab1a2e6d2c78cc0ed2470563a9950f40f81e1ddd81b18572ce4fd98b6'
            '275d517022ca10f9db18915a4879b55909a3ed11acf7fea5154250cccf502048')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
