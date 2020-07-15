# Maintainer: NeedleNardleNoo (conrad@conradhaupt.co.za)
pkgname=systemd-asus-charging-threshold
pkgver=1.1
pkgrel=3
pkgdesc="Systemd service that manages the Asus Zenbook charging threshold. Specifically designed for the Zenbook 15 UX533."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
# url="https://github.com/Jguer/yay"
license=('MIT')
depends=(
    'systemd'
    'linux>=5.4'
    'git'
)
source=("asus-charging-threshold"
        "asus-charging-threshold.path"
        "asus-charging-threshold.service")
sha256sums=('6442bc26a7c562f5afe6467dab36365c709909f6a81afcecfc0c25cff0f1bab0'
        'c1389fd887fecbcb2799fa37ddd956b2dacb7bc1da78d44898578986cd79615e'
        '1709bc93a1c4dff8068b270d0515d99627bebb3a9c19dd5950eb687bc24c4e9e')

package() {
    install -v -D -m644 "${srcdir}/asus-charging-threshold.service" "${pkgdir}/etc/systemd/system/asus-charging-threshold.service"
    install -v -D -m644 "${srcdir}/asus-charging-threshold.path" "${pkgdir}/etc/systemd/system/asus-charging-threshold.path"
    install -v -D -m644 "${srcdir}/asus-charging-threshold" "${pkgdir}/etc/asus-charging-threshold"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/"
    ln -s "${pkgdir}/etc/systemd/system/asus-charging-threshold.path" "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/asus-charging-threshold.path"
}