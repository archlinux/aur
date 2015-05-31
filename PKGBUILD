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
  "https://github.com/downloads/zerodogg/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
  "${pkgname}.desktop"
)
sha256sums=(
  '41ea26b13ad31938c6fdff98bfa8830cac286f2e73cef7920f9897616e6483c4'
  '275d517022ca10f9db18915a4879b55909a3ed11acf7fea5154250cccf502048'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
