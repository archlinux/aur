# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=resolvconf-symlink
pkgver=1
pkgrel=1
pkgdesc="Make /etc/resolv.conf a symlink to a runtime-writable location"
arch=('any')
license=('custom:CC0')
install="${pkgname}.install"
source=("${pkgname}.hook"
        "LICENSE")

# For 32-bit machines
sha256sums=('92dfa503eb283c616f3fdd63faaa9327877060859088e5870cc911d0ca356065'
            '36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673')

# For 64-bit machines
sha512sums=('23a907d716c15f4f6708d0a9740104bd20c735dd9f0574b60f0de96c70f19a7d3682d3842607bea2a4495f675f53505bf09a246624b8c3c29bd9b530e769e949'
            '3e20c74803825a27f7d4208f711d5b5f48bbdcd9487b59e0922fcbfd3b17f3f37440ae3bc024e3183401e4918765e59de8a5896f5a8be8236e4b769c65443cbb')
package() {
    cd "$srcdir"
    install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
