# Maintainer: d10n <david at bitinvert dot com>
pkgname=unified-kernel-image-hooks
pkgver=1.0.0
pkgrel=1
pkgdesc="Unified kernel image UEFI hooks: save the currently-booted efi image as a backup entry"
arch=(x86_64)
url="https://github.com/d10n/arch-unified-kernel-image-hooks"
license=('GPL')
depends=(binutils)
source=(
    90-unified-kernel-image-uefi-ucode.hook
    unified-kernel-image-backup.service
    unified-kernel-image-backup.sh
    )
install=unified-kernel-image-hooks.install
sha256sums=('6aa273c83faf1d15664bb2c39950ffdab0c540f5ace5dd58e531f9a9de515c54'
            'c90ff05c0fb9629f09b1ab7bd672ff2a88dc6a3e6a474ac1c6d82096431c477b'
            '539caa2fdabd1c9e2dcd632ff97cc45d85df62fcb668c8ed8e0de8f8c6504efb')

package() {
    install -m755 -D unified-kernel-image-backup.sh "$pkgdir/usr/libexec/unified-kernel-image-hooks/unified-kernel-image-backup.sh"
    install -m644 -D unified-kernel-image-backup.service "$pkgdir/usr/lib/systemd/system/unified-kernel-image-backup.service"
    install -m644 -D 90-unified-kernel-image-uefi-ucode.hook "$pkgdir/usr/share/libalpm/hooks/90-unified-kernel-image-uefi-ucode.hook"
}
