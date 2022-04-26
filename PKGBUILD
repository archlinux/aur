# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=resolvconf-symlink-systemd-uplink
pkgver=1
pkgrel=2
pkgdesc="Make /etc/resolv.conf a symlink to a runtime-writable location (systemd-resolved uplink mode version)"
arch=('any')
license=('custom:CC0')
depends=('systemd')
conflicts=('resolvconf-symlink' 'resolvconf-symlink-systemd-stub')
install="${pkgname}.install"
source=("${pkgname}.hook"
        "LICENSE")
sha256sums=('2a83ac62d982663e4044b49f1f8d8f7ef8b9f4772ffbd10ebebf3ca9a3fd007b'
            '36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673')
sha512sums=('f0826359071985d77a3d09f442ef4fc74a7a5049afc69b18f25482f69b8f046b5b9e866ef3bd4f315fc93643d5cd0e6f3c349eb31a84dab335e8c6d52a95f834'
            '3e20c74803825a27f7d4208f711d5b5f48bbdcd9487b59e0922fcbfd3b17f3f37440ae3bc024e3183401e4918765e59de8a5896f5a8be8236e4b769c65443cbb')

package() {
    cd "$srcdir"
    install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
