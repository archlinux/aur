# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=resolvconf-symlink
pkgver=1
pkgrel=4
pkgdesc="Make /etc/resolv.conf a symlink to a runtime-writable location (Without systemd-resolved version)"
arch=('any')
license=('Unlicense')
conflicts=('resolvconf-symlink-systemd-stub' 'resolvconf-symlink-systemd-uplink')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha256sums=('92dfa503eb283c616f3fdd63faaa9327877060859088e5870cc911d0ca356065')
sha512sums=('23a907d716c15f4f6708d0a9740104bd20c735dd9f0574b60f0de96c70f19a7d3682d3842607bea2a4495f675f53505bf09a246624b8c3c29bd9b530e769e949')

package() {
    cd "$srcdir"
    install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
