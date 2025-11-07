# Maintainer: AntoienGS <antoineg.simard at gmail dot com>

pkgname=zsh-transient-prompt-git
_name="${pkgname%-git}"
pkgver=r3.86a4147
pkgrel=1
pkgdesc='Transient prompt for Zsh'
arch=('any')
url='https://github.com/olets/zsh-transient-prompt'
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')
provides=("$_name")
conflicts=("$_name")

pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_name"
	install -Dm644 transient-prompt.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$_name/"
	install -Dm644 transient-prompt.zsh-theme -t "$pkgdir/usr/share/zsh/plugins/$_name/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
