# Maintainer: Vlad Petrov <ejiek at mail dot ru>
_pkgname=gruvbox
pkgname=vim-${_pkgname}-community
pkgver=2.2.0
pkgrel=1
pkgdesc="gruvbox color scheme for vim"
arch=('any')
url="https://github.com/gruvbox-community/gruvbox"
license=('MIT')
depends=('vim')
groups=('vim-plugins')
provides=('vim-gruvbox')
conflicts=('vim-gruvbox')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gruvbox-community/gruvbox/archive/v${pkgver}.tar.gz")
sha256sums=('7f6b7607f2e5bad59c2f5331a187592fc9a05c2dc6ef6aefd38d98dd793fe64c')

package() {
    cd ${_pkgname}-${pkgver}
    install -Dm755 "colors/gruvbox.vim" "${pkgdir}/usr/share/vim/vimfiles/colors/gruvbox.vim"
    install -Dm755 "gruvbox_256palette.sh" "${pkgdir}/usr/share/vim/vimfiles/gruvbox_256palette.sh"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}
