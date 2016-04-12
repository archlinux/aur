# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=virtio-win
pkgver=0.1.117.1
pkgver_=0.1.117-1
pkgrel=1
pkgdesc="virtio drivers for Windows (2000, XP, Vista, 7, 8, 10) guests and floppy images for Windows XP"
arch=('any')
url="https://fedoraproject.org/wiki/Windows_Virtio_Drivers"
license=('GPL2')
optdepends=('qemu')
# https://fedorapeople.org/groups/virt/virtio-win/CHANGELOG
changelog="${pkgname}.changelog"
install="${pkgname}.install"
source=("https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${pkgname}-${pkgver_}/${pkgname}.iso"
        "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${pkgname}-${pkgver_}/${pkgname}_amd64.vfd"
        "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${pkgname}-${pkgver_}/${pkgname}_x86.vfd")
noextract=("${pkgname}.iso" "${pkgname}_amd64.vfd" "${pkgname}_x86.vfd")
sha256sums=('79a0721a363d5845b88aab7083986c20647cc3044a442879c4fa7eb601f98005'
            '7429c31c8d4ce0d283008cd715ea2683c6ec4b5ad054d4431bdda825b529679f'
            'e256175e367777011a8599ee24ad2f165b2358bc2df2f0b5c225f4872373c2f7')

package() {
  install -Dm 644 ${pkgname}.iso \
    "$pkgdir/usr/share/virtio/${pkgname}.iso"
  install -Dm 644 ${pkgname}_amd64.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_64.vfd"
  install -Dm 644 ${pkgname}_x86.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_32.vfd"
}

# vim:set ts=2 sw=2 ft=sh et:
