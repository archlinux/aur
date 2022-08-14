# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=resolvconf-symlink-systemd-stub
pkgver=1
pkgrel=2
pkgdesc="Make /etc/resolv.conf a symlink to a runtime-writable location (systemd-resolved stub mode version)"
arch=('any')
license=('Unlicense')
depends=('systemd')
conflicts=('resolvconf-symlink' 'resolvconf-symlink-systemd-uplink')
install="${pkgname}.install"
source=("${pkgname}.hook")
sha256sums=('6b0572223193b1f62d98fadc988dfe2fbcfa2759b116a0ad7595814b5617b227')
sha512sums=('d6acf3a90172cceccacfc9f4f1608342c338e3f78a80082d5b0c1ce455ec857b528dc713e0aeb7bcc25f3df2169d3596d8a0f08f731aa7fc79d91bb9f6fd56f4')

package() {
    cd "$srcdir"
    install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
