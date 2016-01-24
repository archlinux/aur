# Maintainer: Martchus <martchus@gmx.net>
pkgname=blackwidowcontrol
pkgver=1.0.0
pkgrel=3
pkgdesc="Python script to enable macro keys of the Razer BlackWidow keyboard under GNU/Linux"
arch=('any')
license=('GPL')
groups=
provides=
depends=("python" "python-pyusb")
makedepends=
conflicts=
replaces=
backup=
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=
sha256sums=('b840f36debfdf7ce745105b2d187d643ac7588589aa7caf2a475af7da72ef362')

package() {
  _srcdir="${srcdir}/${PROJECT_DIR_NAME:-$pkgname-$pkgver}"
  install -Dm755 "${_srcdir}/blackwidowcontrol.py" "${pkgdir}/usr/bin/blackwidowcontrol"
  install -Dm644 "${_srcdir}/razer_blackwidow.rules" "${pkgdir}/etc/udev/rules.d/70-razer_blackwidow.rules"
}
