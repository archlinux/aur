# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=dots-manager
pkgdesc="A portable tool for managing a single set of dotfiles in an organized fashion"
license=('MIT')
url="https://github.com/evanpurkhiser/dots"
pkgver=1.0.0
pkgrel=1

source=("https://github.com/evanpurkhiser/dots/archive/v${pkgver}.tar.gz")
md5sums=('a627e5136cf3162a66f6e211252b1d51')
depends=('git' 'python')
arch=('any')

package() {
	cd "$srcdir/dots-$pkgver"

	install -Dm 755 bin/dots "${pkgdir}/usr/bin/dots"
	install -Dm 755 contrib/bash_completion "${pkgdir}/usr/share/bash-completion/completions/dots"

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
