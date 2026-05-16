# Maintainer: Charlie <c44014189@gmail.com>
pkgname=framework-laptop-meta
pkgver=1.0.1
pkgrel=3
pkgdesc="Metapackage to install optimal utilities and tweaks for Framework laptops"
arch=('any')
url="https://aur.archlinux.org/packages/framework-laptop-meta"
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
    'ectool-framework-git: Advanced control over fans, battery limits, and LEDs via EC'
)

package() {
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "MIT License (c) $(date +%Y) Charlie" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
