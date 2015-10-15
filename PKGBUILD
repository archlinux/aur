# Maintainer: Javier Tia <javier dot tia at gmail dot com>
pkgname=virtio-win
pkgver=0.1.110.2
pkgver_=0.1.110-2
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
sha256sums=('1581481400271c0b200ec98e27ccce30cfb580d13b42a2277a002eedcaf34a48'
            '6d79d05296d8f11dce35e48b2b248ecf319ab5bcfb12a3d0107909fc64428da9'
            '096728924547812cc6a1fceddaa498f2eefdcd752d1967d0d17b1a5709344180')

package() {
  install -Dm 644 ${pkgname}.iso \
    "$pkgdir/usr/share/virtio/${pkgname}.iso"
  install -Dm 644 ${pkgname}_amd64.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_64.vfd"
  install -Dm 644 ${pkgname}_x86.vfd \
    "$pkgdir/usr/share/virtio/${pkgname}_x86_32.vfd"
}

# vim:set ts=2 sw=2 ft=sh et:
