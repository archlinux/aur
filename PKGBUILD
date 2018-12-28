# Maintainer: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-kernel-install-git
pkgver=r1.79dfc1c
pkgrel=1
pkgdesc='pacman hooks for kernel-install'
url='https://gitlab.com/crazyh/pacman-kernel-install'
license=('GPL')
source=('kernel-install-add.hook' 'kernel-install-remove.hook')
md5sums=(SKIP{,})
arch=('any')
depends=('bash' 'mkinitcpio' 'systemd')
makedepends=('git')
provides=("${pkgname%-git}")

pkgver() {
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm 644 -t "${pkgdir}/usr/share/libalpm/hooks" *.hook
}
