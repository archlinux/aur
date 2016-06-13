# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=blackwidowcontrol
pkgver=1.0.0
pkgrel=4
pkgdesc='Python script to enable macro keys of the Razer BlackWidow keyboard under GNU/Linux'
arch=('any')
license=('GPL')
depends=('python-pyusb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b840f36debfdf7ce745105b2d187d643ac7588589aa7caf2a475af7da72ef362')

package() {
  _srcdir="${srcdir}/${PROJECT_DIR_NAME:-$pkgname-$pkgver}"
  install -Dm755 "${_srcdir}/blackwidowcontrol.py" "${pkgdir}/usr/bin/blackwidowcontrol"
  install -Dm644 "${_srcdir}/razer_blackwidow.rules" "${pkgdir}/etc/udev/rules.d/70-razer_blackwidow.rules"
}
