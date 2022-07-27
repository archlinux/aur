pkgname=edk2-ovmf-loongarch64-bin
_pkgname=edk2-ovmf-loongarch64
pkgdesc="Firmware for Virtual Machines (loongarch64)"
pkgver=20220711
pkgrel=0
provides=( ${_pkgname} )
conflicts=( ${_pkgname} )
arch=(x86_64 aarch64)
license=(BSD)
url="https://github.com/loongson/edk2"
depends=()
source=('90-edk2-ovmf-loongarch64.json' 'https://github.com/loongson/edk2/raw/master/License.txt' 'OvmfPkg.License.txt::https://raw.githubusercontent.com/loongson/edk2/master/OvmfPkg/License.txt' 'OVMF_CODE.fd::https://github.com/yangxiaojuan-loongson/qemu-binary/raw/main/binary-0711/QEMU_EFI.fd')
sha512sums=('5b550c211ecf3e95634f72b754050e864df1460e55c880ef20dd47ee8f11ced9976310cc34eeaa0b0722d5a264564f364c69ab02a53238917dc747e35c8ea951' 'SKIP' 'SKIP' 'df6d0cdef070815c057410832db4663545cfca0ae23c533c7816123a054fbbf8e7a3abae7f4029217e634b5cb2180179ab80c77c39e43fa82c4a25d1119e390b')

package () {
	mkdir -p "$pkgdir/usr/share/edk2-ovmf/loongarch64"
	mkdir -p "$pkgdir/usr/share/licenses/$_pkgname/"
      install -vDm 644 ./OVMF_CODE.fd -t "$pkgdir/usr/share/edk2-ovmf/loongarch64/OVMF_CODE.fd"
install -vDm 644 ./90-edk2-ovmf-loongarch64.json -t "$pkgdir/usr/share/qemu/firmware/"
install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -vDm 644 OvmfPkg.License.txt "$pkgdir/usr/share/licenses/$_pkgname/OvmfPkg.License.txt"
}
