# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=resolvconf-symlink-systemd-stub
pkgver=1
pkgrel=1
pkgdesc="Make /etc/resolv.conf a symlink to a runtime-writable location (systemd-resolved stub mode version)"
arch=('any')
license=('custom:CC0')
depends=('systemd')
conflicts=('resolvconf-symlink' 'resolvconf-symlink-systemd-uplink')
install="${pkgname}.install"
source=("${pkgname}.hook"
        "LICENSE")
sha256sums=('6b0572223193b1f62d98fadc988dfe2fbcfa2759b116a0ad7595814b5617b227'
            '36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673')
sha512sums=('d6acf3a90172cceccacfc9f4f1608342c338e3f78a80082d5b0c1ce455ec857b528dc713e0aeb7bcc25f3df2169d3596d8a0f08f731aa7fc79d91bb9f6fd56f4'
            '3e20c74803825a27f7d4208f711d5b5f48bbdcd9487b59e0922fcbfd3b17f3f37440ae3bc024e3183401e4918765e59de8a5896f5a8be8236e4b769c65443cbb')

package() {
    cd "$srcdir"
    install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
