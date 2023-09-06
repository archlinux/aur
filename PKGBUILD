# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=nvim-ft-pkgbuild
pkgver=1
pkgrel=1
pkgdesc='Neovim PKGBUILD and SRCINFO ft plugins from pacman-contrib'
arch=(any)
license=('GPL')
source=()
sha256sums=()

package() {
	depends+=(neovim pacman-contrib)
	install -dm755 "$pkgdir/usr/share/nvim/runtime/"{ftdetect,ftplugin,syntax}
	for file in {{ftdetect,syntax}/{PKGBUILD,SRCINFO},ftplugin/PKGBUILD}.vim
	do
	ln -s "/usr/share/vim/vimfiles/$file" \
		"$pkgdir/usr/share/nvim/runtime/$file"
	done
}
