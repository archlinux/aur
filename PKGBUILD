# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=resolvconf-symlink-systemd-uplink
pkgver=1
pkgrel=3
pkgdesc="Make /etc/resolv.conf a symlink to a runtime-writable location (systemd-resolved uplink mode version)"
arch=('any')
license=('Unlicense')
depends=('systemd')
conflicts=('resolvconf-symlink' 'resolvconf-symlink-systemd-stub')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha256sums=('2a83ac62d982663e4044b49f1f8d8f7ef8b9f4772ffbd10ebebf3ca9a3fd007b')
sha512sums=('f0826359071985d77a3d09f442ef4fc74a7a5049afc69b18f25482f69b8f046b5b9e866ef3bd4f315fc93643d5cd0e6f3c349eb31a84dab335e8c6d52a95f834')

package() {
    cd "$srcdir"
    install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
