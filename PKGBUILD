# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=4.1.1
pkgrel=1
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('GPL3')
depends=('wimlib' 'syslinux' 'glibc' 'ncurses' 'util-linux' 'bash' 'coreutils'
		 'binutils' 'findutils' 'jq' 'sed' 'grep' 'file' 'gawk' 'rsync' 'curl' 'tar' 'bc'
		 'e2fsprogs' 'dosfstools' 'ntfs-3g')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7591f4b9b68ac691476256d3f2a081754f384dbad8c036a178bd1b19c4051618')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 extra/man/bootiso.1 "$pkgdir/usr/share/man/man1/bootiso.1"
	install -Dm644 extra/completions/completions.zsh "$pkgdir/usr/share/zsh/site-functions/_bootiso"
	install -Dm644 extra/completions/completions.bash "$pkgdir/usr/share/bash-completion/completions/bootiso"
}
