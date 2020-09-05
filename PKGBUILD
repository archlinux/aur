# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=systemd-boot-esp-sync
pkgver=1
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
sha512sums=('496614de97cf29cbc3b6bbc22e5b3178989a4b578902e289ae97a829b126f980c9a4e493a7ce09076bb5cd4832dcda19129e4b8363a4ce58b41ca3bc336c407c'
            'deff33615c558a01f919d351c78a231aaa6a15873be036bf0d8d9b9e9eeea2a525a9c5a58cde3bb72f18e537709a6c831825260411dbec1308f23523120b4034'
            '3505072ccee36370f46b323394e4bc78e0d0d337e19278b65c68dbaf01dddfb47245845c070b5b00bd176f0b15cd7cbada64b4951608490c8d6fe8fb3e4b6c38')

package() {
    install -Dm 755 "${srcdir}/boot-esp-sync" "${pkgdir}/usr/bin/boot-esp-sync"
    install -Dm 644 "${srcdir}/boot-esp-sync.path" "${pkgdir}/usr/lib/systemd/system/boot-esp-sync.path"
    install -Dm 644 "${srcdir}/boot-esp-sync.service" "${pkgdir}/usr/lib/systemd/system/boot-esp-sync.service"
}
