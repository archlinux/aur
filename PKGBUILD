# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-dracula
pkgver=2.0.0
pkgrel=7
pkgdesc="A dark theme for Vim"
arch=('any')
url="https://draculatheme.com/vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-airline-dracula' 'vim-lightline-dracula')
conflicts=('vim-airline-dracula' 'vim-lightline-dracula')
source=("${pkgname}::git+https://github.com/dracula/vim#tag=v${pkgver}")
sha512sums=('8a1ab7b57e3ecd8f19e2326aea17d848caddd4f46bc7932a3ed81e37526edb39a86878240e8a3a9b66d1d58a4f354393327c051cad84dc51097a07831b62d76a')

package() {
	cd "${srcdir}/${pkgname}"
	find after autoload colors doc \
	  -type f -exec install -Dvm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
