# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-kernel-install
pkgver=0.9.1
pkgrel=2
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
	install -Dm755 'kernel-install.sh' \
		-t"${pkgdir}/usr/share/libalpm/scripts/"
}

# sums
sha256sums=('da21c9fcc8d0bdd519682c704f3746ddaa78b83b2c5993eedf2e940a2ea66f41'
            'fb825e1f4831cfdc7a4cc7dd6c1b7e3ddda81f86cf421d38f8dabc6bd6cd0509'
            'b43f75690edb96b628b74ef5812cc3f43f21181a92c9cce6d200c4d69b6e89b1')
