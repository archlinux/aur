# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=bootiso
pkgver=4.0.0
pkgrel=1
pkgdesc="A bash script to securely create a bootable USB device from one ISO file."
arch=('any')
url="https://github.com/jsamr/bootiso"
license=('MIT')
depends=('syslinux' 'mtools' 'rsync' 'bc' 'wimlib'
		 'e2fsprogs' 'dosfstools' 'ntfs-3g')
source=("https://github.com/jsamr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('09627966887d3633c6bf6c05474aec82668864945358e6cf0662752b77b0b823')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bootiso "$pkgdir/usr/bin/bootiso"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 extra/man/bootiso.1 "$pkgdir/usr/share/man/man1/bootiso.1"
	install -Dm644 extra/completions/completions.zsh "$pkgdir/usr/share/zsh/site-functions/_bootiso"
	install -Dm644 extra/completions/completions.bash "$pkgdir/usr/share/bash-completion/completions/bootiso"
}
