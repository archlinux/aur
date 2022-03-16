# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_name='alias-tips'

pkgname="${_name}-git"
pkgver=r109.45e4e97
pkgrel=2
pkgdesc='An oh-my-zsh plugin to help remembering those aliases you defined once'
arch=('any')
license=('unknown')
url='https://github.com/djui/alias-tips'
depends=('zsh')
makedepends=('git')
source=('git+https://github.com/djui/alias-tips.git')
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
