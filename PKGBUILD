# Maintainer: Vresod <lukebinkofsky at gmaildotcom>
pkgname=neovim-vimvi
pkgver=1.0.0
pkgrel=1
pkgdesc="symlinks neovim to vi, vim, and every binary those packages provide"
arch=('any')
url="https://github.com/Duncaen/OpenDoas"
license=('APACHE')
depends=('neovim')
provides=('vi' 'vim')
conflicts=('vi' 'vim')
source=('vimdiff')
sha256sums=('59280029bdf81684836c8b720fdbab3eeb38feff78f0fd843607f5cdd30aa598')
package() {
	install -d "$pkgdir"/usr/bin
	nvim=$(which nvim)
	ln -s $nvim "$pkgdir"/usr/bin/vim
	ln -s $nvim "$pkgdir"/usr/bin/vi
	ln -s $nvim "$pkgdir"/usr/bin/edit
	ln -s $nvim "$pkgdir"/usr/bin/ex
	ln -s $nvim "$pkgdir"/usr/bin/rview
	ln -s $nvim "$pkgdir"/usr/bin/rvim
	ln -s $nvim "$pkgdir"/usr/bin/vedit
	ln -s $nvim "$pkgdir"/usr/bin/view
	install -Dm644 vimdiff "$pkgdir"/usr/bin/vimdiff
	chmod +x "$pkgdir"/usr/bin/vimdiff
}
