# Maintainer: ajsem1337 <64779622+ajsem1337@users.noreply.github.com>
pkgname=system-health
pkgver=0.1.0
pkgrel=1
pkgdesc='Read-only health report for Arch Linux and CachyOS'
arch=('any')
url='https://github.com/ajsem1337/system-health'
license=('MIT')
depends=('python>=3.9' 'systemd' 'pacman' 'util-linux' 'pacutils'
         'rebuild-detector' 'pacman-contrib' 'lm_sensors' 'smartmontools' 'sudo')
optdepends=('gsmartcontrol: graphical disk inspection and self-tests')
_commit=133be9c72efe407491a4ef67699de924a06d083a
source=("system-health-${pkgver}::https://raw.githubusercontent.com/ajsem1337/system-health/${_commit}/system-health"
        "system-health.desktop::https://raw.githubusercontent.com/ajsem1337/system-health/${_commit}/system-health.desktop"
        "LICENSE::https://raw.githubusercontent.com/ajsem1337/system-health/${_commit}/LICENSE")
sha256sums=(
  '7713e5c90ca356ac18e2d08e010a4a9d90dbcb6c0c87e58c81c7eb002133f801'
  '957b5c22e576ddd92b91278c135ce9f69f5a81602f8c0683748590a704bc4ac6'
  '35fb3b11a39d4f2583dca02d38fee84cb4f30b059abe5111f050cfee74b33142'
)

package() {
    install -Dm755 "${srcdir}/system-health-${pkgver}" "${pkgdir}/usr/bin/system-health"
    install -Dm644 "${srcdir}/system-health.desktop" "${pkgdir}/usr/share/applications/system-health.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
