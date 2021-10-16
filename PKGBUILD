# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.5.0
pkgrel=1
pkgdesc="Pacman hooks for kernel-install."
url='https://man.archlinux.org/man/kernel-install.8'
arch=('any')
license=('GPL')
depends=('sh' 'systemd')
source=(
	'90-kernel-install-add.hook'
	'90-kernel-install-remove.hook'
	'kernel-install.sh'
)

package() {
	install -Dm644 '90-kernel-install-add.hook' '90-kernel-install-remove.hook' \
		-t"${pkgdir}/usr/share/libalpm/hooks"
	install -Dm755 'kernel-install.sh' \
		-t"${pkgdir}/usr/share/libalpm/scripts/"
}

# sums
sha256sums=('aafd002b19ec63dbb693d1ee9eaa266bb201b87423e9bdf3471c2ffc19948f8c'
            '6933fde9898d30b7dea53110526215db042dee130e341c3bda6b7610a78fa6da'
            '8cc76c3dc5a3c790e09ff4ea42f871e1ab9be1881337eefe33d20a2ed7c6f6b1')
