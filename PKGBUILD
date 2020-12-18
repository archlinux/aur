# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
pkgver=3.0.0
pkgrel=2
pkgdesc="Keyboard Backlight Driver from TUXEDO Computers"
url="https://github.com/tuxedocomputers/tuxedo-keyboard"
license=("GPL3")
arch=('x86_64') 
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
provides=('tuxedo-keyboard' 'tuxedo-io')
conflicts=('tuxedo-cc-wmi')
replaces=('tuxedo-cc-wmi')
backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver-tar.gz::https://github.com/tuxedocomputers/tuxedo-keyboard/archive/v${pkgver}.tar.gz)
sha256sums=('95bd38393d07329f1f944abcb20254a28f58b0f1551c63241396cc7fd4fc1972')
sha512sums=('1c6b2a0c086aaa6bd21795371d4747773608389be2d98d10d8e07499dfa63a628f639fa9ddfee4901e5c9d3b90c06116d1c537a8d7b6130612ea64fabcaedade')

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
}
