# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname=vim-dracula-git
pkgver=2.0.0.r103.g65f4225
pkgrel=1
pkgdesc="A dark theme for Vim"
arch=('any')
url="https://draculatheme.com/vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=('vim-dracula' 'vim-airline-dracula' 'vim-lightline-dracula')
conflicts=('vim-dracula' 'vim-airline-dracula' 'vim-lightline-dracula')
source=("${pkgname}::git+https://github.com/dracula/vim")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "${pkgname}"
	find autoload colors doc \
	  -type f -exec install -Dvm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}
