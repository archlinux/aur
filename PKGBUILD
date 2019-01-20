# Maintainer: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-kernel-install-git
pkgver=r7.8c288c0
pkgrel=1
pkgdesc='pacman hooks for kernel-install'
url='https://github.com/crazyh/pacman-kernel-install'
license=('GPL')
source=('git+https://github.com/crazyh/pacman-kernel-install')
md5sums=('SKIP')
arch=('any')
depends=('bash' 'mkinitcpio' 'systemd')
makedepends=('git')
provides=("${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"

	install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" *.hook
}
