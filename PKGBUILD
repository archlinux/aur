#Maintainter: Joost Bremmer <toost.b@gmail.com>
#Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=neovim-bufexplorer
pkgver=7.4.12
pkgrel=1
pkgdesc="A simple buffer list/switcher for Neovim"
arch=('any')
url="https://github.com/jlanzarotta/${pkgname#neovim-}"
license=('BSD')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bcd8549fdd64d149356f1995eaf3f7cd6e0996d8c9128b41085772a24e13a00a')
conflicts=('neovim-buffexplorer')

package() {
	cd ${srcdir}/${pkgname#neovim-}-${pkgver}

	installpath="${pkgdir}/usr/share/nvim/runtime"

	install -D -m644 doc/bufexplorer.txt $installpath/doc/bufexplorer.txt
	install -D -m644 plugin/bufexplorer.vim $installpath/plugin/bufexplorer.vim
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
