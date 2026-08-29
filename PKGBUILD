# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=dell-xps-brightness-dkms
pkgver=1.0.1
pkgrel=1
pkgdesc="DKMS driver for Dell XPS L702X EC hardware brightness keys (Fn+F4 / Fn+F5)"
arch=('any')
url="https://github.com/Twilight0/dell-xps-brightness-dkms"
license=('GPL-2.0-or-later')
depends=('dkms')
source=("dell-xps-brightness.c"
        "Makefile"
        "dkms.conf"
        "dell-xps-brightness.conf")
sha256sums=('2fe23b008a2d4ba2ff41c4aae2864849aef83668d7a388c059041b8b53b7860f'
            'abaaf738c5ee608fd417a1f22e9bce249beaa7bc3c937970465b13e5d6bf1aed'
            'd0379f43530554eeadd5bf2855d85e1eb68981c94df86a9cfc1607497a7a1c77'
            '72d0efb0a0dc01a072200f6302b6de7aa34d07421e035de9307e3a32c7699e6d')

package() {
    local dkms_dir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"

    install -dm755 "${dkms_dir}"
    install -m644 "${srcdir}/dell-xps-brightness.c" "${dkms_dir}/"
    install -m644 "${srcdir}/Makefile" "${dkms_dir}/"
    install -m644 "${srcdir}/dkms.conf" "${dkms_dir}/"

    install -Dm644 "${srcdir}/dell-xps-brightness.conf" "${pkgdir}/usr/lib/modules-load.d/dell-xps-brightness.conf"
}
