# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-keyboard
pkgver=3.0.1
pkgrel=1
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
sha256sums=('60e9996fcad1dd7f6eb4ca5cb14fa81aad3bebf38a72c14293bea2ea95c6c055')
sha512sums=('85c31afd79f2acac4d19d7b0d4bf8fc0c2d7990aedc97ed474671482a74c4b009f82ec81b73a02c0c1041ed7384cb9ccb612a8f3cd7ee39f6e716404ccf29167')

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/tuxedo_keyboard.conf "${pkgdir}/etc/modprobe.d/tuxedo_keyboard.conf"
}
