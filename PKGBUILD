# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=systemd-boot-esp-sync
pkgver=2.2
pkgrel=1
pkgdesc="Sync /boot to your machines /efi"
url='https://aur.archlinux.org/packages/systemd-boot-esp-sync/'
arch=('any')
license=('MIT')
depends=('systemd' 'rsync')
install=$(/usr/bin/tail -n 1 /usr/lib/os-release | /usr/bin/cut -d= -f2).install
source=("boot-esp-sync"
	"99-boot-esp-sync.hook"
	"boot-esp-sync.path"
	"boot-esp-sync.service")
sha512sums=('b9a15641b86d6177dec64d5b96a4f094fdd280df869e6be78cfb0abfcf83407184db6aae87c0b9252ac353c81e81f33943667fe34f8e417aa714bef78aaa1f67'
            '368f65cad2887ac9f485a3eb2b1d25929dfa559fe76df120b77dde692a2523e311203bbff39dcd25cc8027ba7d65bd77539519c54ffe4528a9c125fae55df0d5'
            '0c8747ed02b1bbd38b3aff8185498b65c561860c84119d5e07f3e645fff94389a6b9f91e522da43a97e5eff07d2b2911f01b8b529e9f89ff5dfb73282ffe0c2b'
            '3505072ccee36370f46b323394e4bc78e0d0d337e19278b65c68dbaf01dddfb47245845c070b5b00bd176f0b15cd7cbada64b4951608490c8d6fe8fb3e4b6c38')

package() {
    install -Dm 755 "${srcdir}/boot-esp-sync" "${pkgdir}/usr/bin/boot-esp-sync"
    install -Dm 644 "${srcdir}/99-boot-esp-sync.hook" "${pkgdir}/usr/share/libalpm/hooks/99-boot-esp-sync.hook"
    install -Dm 644 "${srcdir}/boot-esp-sync.path" "${pkgdir}/usr/lib/systemd/system/boot-esp-sync.path"
    install -Dm 644 "${srcdir}/boot-esp-sync.service" "${pkgdir}/usr/lib/systemd/system/boot-esp-sync.service"
}
