# Maintainer: Jonas Holst Damtoft <jonasdamtoft@gmail.com>
pkgname=dotfiles.sh-git
pkgver=r13.fb2bd25
pkgrel=1
pkgdesc="A dotfiles manager using git meta files"
arch=('any')
url="https://github.com/eli-schwartz/dotfiles.sh"
license=('GPL')
depends=('git')
provides=('dotfiles.sh')
conflicts=('dotfiles.sh')
source=("${pkgname%-git}::git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 "dotfiles" "$pkgdir/usr/bin/dotfiles"
	install -Dm755 "completion/dotfiles.bash" "$pkgdir/usr/share/bash-completion/completions/dotfiles"
	install -Dm755 "completion/dotfiles.zsh" "$pkgdir/usr/share/zsh/site-functions/dotfiles"
}
