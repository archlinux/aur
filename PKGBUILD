# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=virtio-win
_ver=0.1.118
pkgver=${_ver}.1
pkgver_=${_ver}-1
pkgrel=1
pkgdesc="virtio drivers for Windows (2000, XP, Vista, 7, 8, 10) guests and floppy images for Windows XP"
arch=('any')
url="https://fedoraproject.org/wiki/Windows_Virtio_Drivers"
license=('GPL2')
optdepends=('qemu')
# https://fedorapeople.org/groups/virt/virtio-win/CHANGELOG
changelog="${pkgname}.changelog"
# install="${pkgname}.install"
source=("https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${pkgname}-${pkgver_}/${pkgname}.iso"
        "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${pkgname}-${pkgver_}/${pkgname}_amd64.vfd"
        "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${pkgname}-${pkgver_}/${pkgname}_x86.vfd")
noextract=("${pkgname}.iso" "${pkgname}_amd64.vfd" "${pkgname}_x86.vfd")
sha256sums=('06272cd48b2c504daf3d70b315933b456c2b954d936c3ac3f0f5cda9ba3b905d'
            'b13eca0898538d7282321f8b07cc3f4ec00ac16a64ee8fdde9f8cc5c5e808b4d'
            'e838d5f500e63a73e70e665c86117eac625c86db49a190e88978185fabe46e62')

package() {
  install -Dm 644 ${pkgname}.iso \
    "$pkgdir/usr/share/virtio/${pkgname}.iso"
  install -Dm 644 ${pkgname}_amd64.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_64.vfd"
  install -Dm 644 ${pkgname}_x86.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_32.vfd"
}

# vim:set ts=2 sw=2 ft=sh et:
