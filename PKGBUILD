# Maintainer: Stanislav N. ala pztrn <pztrn at pztrn dot name>

pkgname=mkinitcpio-dm-partprobe
pkgver=20210103
pkgrel=1
pkgdesc="This is an initcpio hook for probing partitions after device mapper maps devices (e.g. after 'encrypt' hook)."
url="https://aur.archlinux.org/packages/mkinitcpio-dm-partprobe/"
arch=('any')
license=('MIT')
depends=('file' 'parted')
source=("hook.dm-partprobe" "install.dm-partprobe")
sha256sums=(
    "3ded8bee639bd2569fe5a5f4a7dbea048a88a718fc97360f18b453f0af26f58d"
    "6e6bf9dc5d9512a288162ca02cfae3785b56f50d95da101dccdab3cd691cacf1"
)

package() {
    cd "${srcdir}/"

    install -Dm644 install.dm-partprobe "${pkgdir}/usr/lib/initcpio/install/dm-partprobe"
    install -Dm644 hook.dm-partprobe "${pkgdir}/usr/lib/initcpio/hooks/dm-partprobe"
}
