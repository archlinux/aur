# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-kernel-install
pkgver=0.16.0
pkgrel=1
pkgdesc="Pacman hooks for kernel-install."
url='https://man.archlinux.org/man/kernel-install.8'
arch=('any')
license=('GPL')
depends=('bash' 'systemd')
source=(
	'90-kernel-install-add.hook'
	'40-kernel-install-remove.hook'
	'kernel-install.sh'
)

package() {
	install -Dm644 '90-kernel-install-add.hook' '40-kernel-install-remove.hook' \
		-t"${pkgdir}/usr/share/libalpm/hooks"
	install -Dm755 'kernel-install.sh' "${pkgdir}/usr/share/libalpm/scripts/kernel-install"
}

# sums
sha256sums=('e4c08f21a599e299f16df5be6c47436be459786ad471ccd4f5cd55bda5e90f81'
            '37c0ef6d0a38f526645234de6f35bcd6bab5496412c1a151cb3162f89cebdff8'
            '0ace09a2fe4a4d49bb1767545740297cd03c803ce52bb48b2d72913b6013d49f')
