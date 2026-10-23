# Maintainer: ajsem1337 <64779622+ajsem1337@users.noreply.github.com>
pkgname=system-health
pkgver=0.2.0
pkgrel=1
pkgdesc='Read-only health report for Arch Linux and CachyOS'
arch=('any')
url='https://github.com/ajsem1337/system-health'
license=('MIT')
depends=('python>=3.11' 'systemd' 'pacman' 'util-linux' 'pacutils'
         'rebuild-detector' 'pacman-contrib' 'lm_sensors' 'smartmontools' 'sudo')
optdepends=('gsmartcontrol: graphical disk inspection and self-tests'
            'kitty: supported terminal for the desktop launcher')
_commit=f3731ce32c981d7020793894360644b191b4fd11
source=("system-health-${pkgver}::https://raw.githubusercontent.com/ajsem1337/system-health/${_commit}/system-health"
        "system-health.desktop::https://raw.githubusercontent.com/ajsem1337/system-health/${_commit}/system-health.desktop"
        "LICENSE::https://raw.githubusercontent.com/ajsem1337/system-health/${_commit}/LICENSE")
sha256sums=(
  'b6dfa578f14e0d58acec325a3cd1e5bd0a7c968c22236e21b0ced5c0f43ab53f'
  '003be01dd7ff8378b821ed6a548605ea0be93c39360f6e62255a1d43237fb52a'
  '35fb3b11a39d4f2583dca02d38fee84cb4f30b059abe5111f050cfee74b33142'
)

package() {
    install -Dm755 "${srcdir}/system-health-${pkgver}" "${pkgdir}/usr/bin/system-health"
    install -Dm644 "${srcdir}/system-health.desktop" "${pkgdir}/usr/share/applications/system-health.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
