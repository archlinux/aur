# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=systemd-boot-esp-sync
pkgver=2
pkgrel=0
pkgdesc="Sync /boot to your machines /efi"
url='https://aur.archlinux.org/packages/systemd-boot-esp-sync/'
arch=('any')
license=('MIT')
depends=('systemd' 'rsync')
install=$(/usr/bin/tail -n 1 /usr/lib/os-release | /usr/bin/cut -d= -f2).install
source=("boot-esp-sync"
		"boot-esp-sync.path"
		"boot-esp-sync.service")
sha512sums=('7e896142a4441eec13c692647d9c9a028bce5af4bbff7a27a0f347da7676c71bfcaaa92d8cfbf021ae6f6d7bd55dea285ac6c0f6a42bbd80136858d667599a8d'
            '0c8747ed02b1bbd38b3aff8185498b65c561860c84119d5e07f3e645fff94389a6b9f91e522da43a97e5eff07d2b2911f01b8b529e9f89ff5dfb73282ffe0c2b'
            '3505072ccee36370f46b323394e4bc78e0d0d337e19278b65c68dbaf01dddfb47245845c070b5b00bd176f0b15cd7cbada64b4951608490c8d6fe8fb3e4b6c38')

package() {
    install -Dm 755 "${srcdir}/boot-esp-sync" "${pkgdir}/usr/bin/boot-esp-sync"
    install -Dm 644 "${srcdir}/boot-esp-sync.path" "${pkgdir}/usr/lib/systemd/system/boot-esp-sync.path"
    install -Dm 644 "${srcdir}/boot-esp-sync.service" "${pkgdir}/usr/lib/systemd/system/boot-esp-sync.service"
}
