# Maintainer: eNV25 <env252525@gmail.com>
# Contributor: Sergey Zolotorev <sergey.zolotorev@gmail.com>

pkgname=pacman-hook-kernel-install
pkgver=0.7.0
pkgrel=1
pkgdesc="Pacman hooks for kernel-install."
url='https://man.archlinux.org/man/kernel-install.8'
arch=('any')
license=('GPL')
depends=('sh' 'systemd')
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
sha256sums=('53d088a00565e1a24f3628219849964ab84c6d421420f373618e9f53af45d525'
            '9a0c20db7ea168cfaa0ca4e129fe5388954a84e8815278819de7f36278b770ae'
            '82bfd6c6220dcfefafb6538cebdc2aef69f7a9832d06fd94ca3368eaace71812')
