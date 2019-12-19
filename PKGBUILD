# Maintainer: Andrii Burkivskyi <buryk212@gmail.com>
_gitname='zsh-completion-generator'
pkgname="${_gitname}-git"
pkgver=r35.6eb6392
pkgrel=1
pkgdesc="Plugin that generates completion functions automatically from getopt-style help texts."
arch=('any')
url="https://github.com/RobSis/zsh-completion-generator"
license=('GPL')
depends=('zsh' 'python')
makedepends=('git')
provides=('zsh-completion-generator')
conflicts=('zsh-completion-generator')
source=('git+https://github.com/RobSis/zsh-completion-generator.git')
install=zsh-completion-generator-git.install
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	mkdir completions
	install -d completions "${pkgdir}/usr/share/zsh/plugins/${_gitname}/completions"
	install -Dm644 zsh-completion-generator.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/${_gitname}/zsh-completion-generator.plugin.zsh"
	install -Dm644 help2comp.py "${pkgdir}/usr/share/zsh/plugins/${_gitname}/help2comp.py"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
