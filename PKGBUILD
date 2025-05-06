pkgname=sudo-rs-symlink
pkgdesc="Symlinks to sudo from sudo-rs"
pkgver=0.2.5
arch=(any)
pkgrel=3
depends=(sudo-rs)
backup=('etc/sudoers')
provides=(sudo)
conflicts=(sudo)
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/sudo/-/raw/main/sudo.pam"
sudoers)
sha256sums=('d1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2'
            '2a4fb692bcdb77dbe3548a83110696edac0863258b5edf3e125a3870994bca2e')
package (){
	mkdir -p "$pkgdir"/usr/bin
	install -Dm644 sudo.pam "$pkgdir"/etc/pam.d/sudo
	install -Dm0440 sudoers "$pkgdir"/etc/sudoers
	#ln -sf /usr/bin/visudo-rs "$pkgdir"/usr/bin/visudo
	ln -sf /usr/bin/sudo-rs "$pkgdir"/usr/bin/sudo
}
