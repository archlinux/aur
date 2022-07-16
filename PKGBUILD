# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=blackwidowcontrol
pkgver=1.1.0
pkgrel=1
pkgdesc='Python script to enable macro keys of the Razer BlackWidow keyboard under GNU/Linux'
url='https://github.com/Martchus/blackwidowcontrol'
arch=('any')
license=('GPL')
depends=('python-pyusb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bd679a4574de8a4d2b7ab4d56bf57559cf3bff130104636b82d083a62251c00d')

package() {
  local _srcdir="${srcdir}/${PROJECT_DIR_NAME:-$pkgname-$pkgver}"
  install -Dm755 "${_srcdir}/blackwidowcontrol.py" "${pkgdir}/usr/bin/blackwidowcontrol"
  install -Dm644 "${_srcdir}/razer_blackwidow.rules" "${pkgdir}/etc/udev/rules.d/70-razer_blackwidow.rules"
}
