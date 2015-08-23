# Maintainer: Javier Tia <javier.tia at gmail dot com>
pkgname=virtio-win
pkgver=0.1.109.1
pkgver_=0.1.109-1
pkgrel=7
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
sha256sums=('0fb43f072664197fc8d5cce9ce40eee933310b24d2b26f5179ce72ee5488f5aa'
            '330c50cc5a42f16df5f24288194585424598a775b8e7e15cf17ebdbf2448169c'
            '5198fa38c69b55a8896a348193023f0c251e257c8b190cd42b20b55677ec7336')

package() {
  install -Dm 644 ${pkgname}.iso \
    "$pkgdir/usr/share/virtio/${pkgname}.iso"
  install -Dm 644 ${pkgname}_amd64.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_64.vfd"
  install -Dm 644 ${pkgname}_x86.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_32.vfd"
}

# vim:set ts=2 sw=2 ft=sh et:
