# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=pacman-hook-kernel-install
pkgver=0.12.0
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
sha256sums=('1acd13999d9cb8fa2c46e040598f62636e8d3969622220eb4cf564f4a380ddd4'
            '23b046f9ef43d888691d425c95841317de6104dab31bcccf62fbc4f34317ff26'
            'e79a3c74e0fdc3ab9d9f1967b38aa6ca7f10d189bc4975da661b0f20a75cfcc2')
