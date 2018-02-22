# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=ranger-vim
pkgver=2.0
pkgrel=2
pkgdesc="Ranger integration for vim"
license=('MIT')
arch=('any')
url="https://github.com/francoiscabrol/ranger.vim"
depends=('vim' 'ranger')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/francoiscabrol/${pkgname/-/.}/archive/${pkgver}.tar.gz")
md5sums=('59f24462eb5c7561756a646585cd9e4c')

package() {
    install -Dm755 "${pkgname/-/.}-${pkgver}/plugin/ranger.vim" \
		"${pkgdir}/usr/share/vim/vimfiles/plugin/ranger.vim"

	head -n 22 "${pkgname/-/.}-${pkgver}/plugin/ranger.vim" > LICENSE
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
