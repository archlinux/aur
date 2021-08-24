# Author: Artemii Sudakov <finziyr@yandex.ru>

pkgname="kesboot-git"
pkgver="1.0"
pkgrel="1"
pkgdesc='Script for automating work with EFI Kernel Stub (linux)'
arch=('x86_64')
url="https://github.com/BiteDasher/kesboot"
license=('MIT')
depends=('efibootmgr' 'sed' 'grep' 'util-linux' 'coreutils')
source=("${pkgname}::git+https://github.com/BiteDasher/kesboot.git")
sha512sums=("SKIP")
package() {
	cd "$srcdir/$pkgname"
	export pkgdir
	./install.sh makepkg
	install -Dm755 ./firstboot "$pkgdir"/usr/lib/setup-efi-boot
}
