# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname=apt-zsh-completion
pkgver=5.9.1
pkgrel=1
pkgdesc="Zsh completion for apt and dpkg"
arch=("any")
url="https://zsh.org/"
license=("custom")
depends=("zsh")
options=(!debug)
source=("$pkgname@zsh-v$pkgver.tar.xz::${url%/}/pub/old/zsh-$pkgver.tar.xz")
sha256sums=("5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416b5042e58d8280d")
sha512sums=("e16c13559262577e725b290c35ce6598d58c2acdd204eac619e8ed9b6a918bce39bfbf9d3ef4c5eb877af7d3279c8a4b15439eba6a38c4e4d47d5555d5f79872")

package() {
	cd -- "$srcdir/zsh-$pkgver/"
	install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" Completion/Debian/{Command/_{apt,dpkg},Type/_deb_{file,package}s}
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}

build() {
	cd -- "$srcdir/zsh-$pkgver/"
	mv -f "LICENCE" "LICENSE"
}

# https://github.com/zsh-users/zsh/tree/master/Completion/Debian
optdepends=("apt: commandline package manager" "dpkg: Debian package management system")

# https://gitlab.archlinux.org/archlinux/packaging/packages/zsh
# sha512sums=
