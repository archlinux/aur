# Maintainer: Charlie <c44014189@gmail.com>
pkgname=framework-laptop-meta
pkgver=1.0.4
pkgrel=5
pkgdesc="Metapackage to install optimal utilities and tweaks for Framework laptops"
arch=('any')
url="https://frame.work"
license=('MIT')

depends=(
    'power-profiles-daemon'  # Default power management (Conflicts with TLP)
    'fprintd'                # Fingerprint sensor support
    'brightnessctl'          # Function keys for screen brightness
    'bluez'                  # Bluetooth stack
    'bluez-utils'            # Bluetooth tools
    'fwupd'                  # For framework firmware updates
    'linux-firmware'         # For WiFi and Bluetooth cards
    'i2c-tools'              # To interface with hardware sensor and expansion modules
)

optdepends=(
    'amd-ucode: Microcode updates for AMD Framework models'
    'intel-ucode: Microcode updates for Intel Framework models'
    'via: For configuring Framework 16 QMK layouts'
    'thermald: Intel management daemon to prevent throttling'
    'tlp: Alternative power management (disable power-profiles-daemon first)'
    'iio-sensor-proxy: Enables ambient light sensor for auto brightness'
    'framework-system: CLI and service for controlling EC, charge limit,and expansion cards'
)
source=("LICENSE")
sha256sums=('cbf0735220d8d7d758f2ea55cb82b7924a177538ff3331e5a62968f055dab627')


package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
