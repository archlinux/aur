# Maintainer: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-kernel-install-git
pkgver=r1.79dfc1c
pkgrel=2
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
	install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" *.hook
}
