# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=blackwidowcontrol
pkgver=1.0.1
pkgrel=1
pkgdesc='Python script to enable macro keys of the Razer BlackWidow keyboard under GNU/Linux'
arch=('any')
license=('GPL')
depends=('python-pyusb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d3fadf1fb4611528afd0bbe214e178821505cb5becbc784ed68727548a4c3355')

package() {
  _srcdir="${srcdir}/${PROJECT_DIR_NAME:-$pkgname-$pkgver}"
  install -Dm755 "${_srcdir}/blackwidowcontrol.py" "${pkgdir}/usr/bin/blackwidowcontrol"
  install -Dm644 "${_srcdir}/razer_blackwidow.rules" "${pkgdir}/etc/udev/rules.d/70-razer_blackwidow.rules"
}
