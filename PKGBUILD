# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-dracula
pkgver=2.0.0
pkgrel=4
pkgdesc="A dark theme for Vim"
arch=('any')
url="https://draculatheme.com/vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
provides=('vim-airline-dracula' 'vim-lightline-dracula')
conflicts=('vim-airline-dracula' 'vim-lightline-dracula')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dracula/vim/archive/v${pkgver}.tar.gz")
sha512sums=('cd86681aff1bd5dfc3b6747e7468fa192776c00cd10dbf6ae99703a679f2576d7c9e1439a829c22459b7bc3248d3657213c6a8d68acd579bb90cf496fa089c71')

package() {
	cd "vim-$pkgver"
	find after autoload colors doc \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
