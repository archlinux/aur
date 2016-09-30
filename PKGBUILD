# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=virtio-win
_ver=0.1.126
pkgver=${_ver}.2
_pkgver=${_ver}-2
pkgrel=1
pkgdesc="virtio drivers for Windows (2000, XP, Vista, 7, 8, 10) guests and floppy images for Windows XP"
arch=('any')
url="https://fedoraproject.org/wiki/Windows_Virtio_Drivers"
license=('GPL2')
optdepends=('qemu')
# https://fedorapeople.org/groups/virt/virtio-win/CHANGELOG
changelog="${pkgname}.changelog"
# install="${pkgname}.install"
_url=https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio
source=("${_url}/${pkgname}-${_pkgver}/${pkgname}.iso"
        "${_url}/${pkgname}-${_pkgver}/${pkgname}_amd64.vfd"
        "${_url}/${pkgname}-${_pkgver}/${pkgname}_x86.vfd")
noextract=("${pkgname}.iso" "${pkgname}_amd64.vfd" "${pkgname}_x86.vfd")
sha256sums=('39890b158664fbfe080ed880a61a81d20c80e0b8762febb8f8e09a82be65dd38'
            '99b41b373f4e159dfcdf28272c4c2f416336d97332a49943f81f053528dae641'
            '0767cd279234f4b93e5f805436bb13ecb2c1415cb5fe783c397aba5a2efedc97')

package() {
  install -Dm 644 ${pkgname}.iso \
    "${pkgdir}/usr/share/virtio/${pkgname}.iso"
  install -Dm 644 ${pkgname}_amd64.vfd \
    "${pkgdir}/usr/share/virtio/${pkgname}_x86_64.vfd"
  install -Dm 644 ${pkgname}_x86.vfd \
    "${pkgdir}/usr/share/virtio/${pkgname}_x86_32.vfd"
}

# vim:set ts=2 sw=2 ft=sh et:
