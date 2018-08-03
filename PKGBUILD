# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_name='alias-tips'

pkgname="${_name}-git"
pkgver=r97.77c7aa2
pkgrel=1
pkgdesc='An oh-my-zsh plugin to help remembering those aliases you defined once'
arch=('any')
license=('unknown')
url='https://github.com/djui/alias-tips'
depends=('zsh')
makedepends=('git')
source=("${_name}::${url//https/git}")
sha512sums=('SKIP')

pkgver() {
	cd "${_name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_name}"
	install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
	cp -a --no-preserve=ownership *.py *.zsh "${pkgdir}/usr/share/zsh/plugins/${_name}"
}
