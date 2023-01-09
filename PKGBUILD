# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-kernel-install
pkgver=0.11.0
pkgrel=1
pkgdesc="Pacman hooks for kernel-install."
url='https://man.archlinux.org/man/kernel-install.8'
arch=('any')
license=('GPL')
depends=('bash' 'systemd')
source=(
	'90-kernel-install-add.hook'
	'60-kernel-install-remove.hook'
	'kernel-install.sh'
)

package() {
	install -Dm644 '90-kernel-install-add.hook' '60-kernel-install-remove.hook' \
		-t"${pkgdir}/usr/share/libalpm/hooks"
	install -Dm755 'kernel-install.sh' "${pkgdir}/usr/share/libalpm/scripts/kernel-install"
}

# sums
sha256sums=('7544af3b61b8fc16e4374447a086707d6b3e23cf2d2cc9d4dbf1168d81e72523'
            '7794b90baac33380a195d65017fcc51420ef141d2f95a5c94abe06b2999a787d'
            '4e7e6134473aa47e2c130b095b6faa2c5d72b2fb4d0dff66f50d048da6c0ec2d')
