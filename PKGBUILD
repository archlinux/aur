# Maintainer: Nicola Pagliuca <nicola.pagliuca at pm dot me>
# Co-Maintainer: Aethar <elliott.ashby88@gmail.com>
_basename='wl-freeze'
pkgname="$_basename-git"
pkgver=2.0.1.r1.53475ba
pkgrel=1
pkgdesc="wl-freeze is a community-driven utility to suspend a game process (and other programs) in Wayland compositors."
arch=('any')
url="https://github.com/Zerodya/wl-freeze"
license=('GPL')
depends=('bash' 'jq' 'psmisc')
optdepends=('libnotify: notifications')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("git+$url")
md5sums=('SKIP')

package() {
    cd "$_basename"
    install -Dm755 ./$_basename "$pkgdir/usr/bin/$_basename"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$_basename/LICENSE"
	install -Dm644 ./completions/bash/wl-freeze "$pkgdir/usr/share/bash-completion/completions/wl-freeze"
	install -Dm644 ./completions/fish/wl-freeze.fish "$pkgdir/usr/share/fish/completions/wl-freeze.fish"
	install -Dm644 ./completions/zsh/_wl-freeze "$pkgdir/usr/share/zsh/site-functions/_wl-freeze"
}
