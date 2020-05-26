# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=4.1.0
pkgrel=2
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('GPL3')
depends=('wimlib' 'syslinux' 'bash' 'coreutils' 'util-linux'
		 'findutils' 'jq' 'sed' 'grep' 'file' 'gawk' 'mtools'
		 'rsync' 'curl' 'tar' 'bc'
		 'e2fsprogs' 'dosfstools' 'ntfs-3g')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0a81f18ce356ec823f64b9235b4c1c1d5067a6f7f25175e74a7279078ecf81b1')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 extra/man/bootiso.1 "$pkgdir/usr/share/man/man1/bootiso.1"
	install -Dm644 extra/completions/completions.zsh "$pkgdir/usr/share/zsh/site-functions/_bootiso"
	install -Dm644 extra/completions/completions.bash "$pkgdir/usr/share/bash-completion/completions/bootiso"
}
