#Maintainter: Joost Bremmer <toost.b@gmail.com>
#Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=neovim-bufexplorer
pkgver=7.4.26
pkgrel=1
pkgdesc="A simple buffer list/switcher for Neovim"
arch=('any')
url="https://github.com/jlanzarotta/${pkgname#neovim-}"
license=('BSD')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("$pkgname.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3302df8f942729e2735f5f9c918f70cd308225fc6e1d3adc8ffb86988d00db80')
conflicts=('neovim-buffexplorer')

package() {
	cd ${srcdir}/${pkgname#neovim-}-${pkgver}

	installpath="${pkgdir}/usr/share/nvim/runtime"

	install -D -m644 doc/*  -t "$installpath/doc/"
	install -D -m644 plugin/* -t "$installpath/plugin/"
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
