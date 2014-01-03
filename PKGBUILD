# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

_gitname=dots

pkgname=dots-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="A portable tool for managing a single set of dotfiles in an organized fashion"
arch=(any)
license=('MIT')
url="https://github.com/EvanPurkhiser/${_gitname}"
depends=(git python)
source=("https://github.com/EvanPurkhiser/${_gitname}/archive/v${pkgver}.tar.gz")
md5sums=('a627e5136cf3162a66f6e211252b1d51')

package() {
	cd "${srcdir}/${_gitname}-${pkgver}"

	install -Dm 755 bin/dots "${pkgdir}/usr/bin/dots"
	install -Dm 755 contrib/bash_completion "${pkgdir}/usr/share/bash-completion/completions/dots"

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
