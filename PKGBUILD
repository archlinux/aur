pkgname=sudo-rs-symlink
pkgdesc="Symlinks to sudo from sudo-rs"
pkgver=0.2.6
arch=(any)
pkgrel=1
depends=(sudo-rs)
backup=('etc/sudoers')
provides=(sudo)
conflicts=(sudo)
source=("https://gitlab.archlinux.org/archlinux/packaging/packages/sudo/-/raw/main/sudo.pam"
sudoers)
sha256sums=('d1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2'
            '7ac68efbbacbe545298950151592ae89eda6a61494e4cb18819e37633baa04f4')
package (){
	install -Dm644 sudo.pam "$pkgdir"/etc/pam.d/sudo
	install -Dm0440 sudoers "$pkgdir"/etc/sudoers
	install -d "$pkgdir"/usr/bin
	ln -svf /usr/bin/visudo-rs "$pkgdir"/usr/bin/visudo
	ln -svf /usr/bin/sudo-rs "$pkgdir"/usr/bin/sudo
}
