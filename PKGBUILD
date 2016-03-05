# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=virtio-win
pkgver=0.1.113.1
pkgver_=0.1.113-1
pkgrel=1
pkgdesc="virtio drivers for Windows (2000, XP, Vista, 7, 8) guests and floppy images for Windows XP"
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
sha256sums=('252ebf77809cb3adbc9e089024f60929e962d9ec7360e0acc4fb79f13c3b6886'
            '47289f915fc1fd8fccea88467155d8a558cbda8ee963c54364581787214fbc75'
            '34df41ccf29214ab4c39e455bfb505514ae3b172dc25c16b6029f665f7a52a6c')

package() {
  install -Dm 644 ${pkgname}.iso \
    "$pkgdir/usr/share/virtio/${pkgname}.iso"
  install -Dm 644 ${pkgname}_amd64.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_64.vfd"
  install -Dm 644 ${pkgname}_x86.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_32.vfd"
}

# vim:set ts=2 sw=2 ft=sh et:
