# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=4.2.0
pkgrel=1
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('GPL3')
depends=('wimlib' 'syslinux' 'glibc' 'ncurses' 'util-linux' 'bash' 'coreutils'
		 'binutils' 'findutils' 'jq' 'sed' 'grep' 'file' 'gawk' 'rsync' 'curl' 'tar' 'bc'
		 'e2fsprogs' 'dosfstools' 'ntfs-3g')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('eaf0cedb31d2195546e882624b7f1f0abbb3a6bb6234b4408dfeb2eaeaff3a50')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 extra/man/bootiso.1 "$pkgdir/usr/share/man/man1/bootiso.1"
	install -Dm644 extra/completions/completions.zsh "$pkgdir/usr/share/zsh/site-functions/_bootiso"
	install -Dm644 extra/completions/completions.bash "$pkgdir/usr/share/bash-completion/completions/bootiso"
}
