# Maintainer: Nicola Pagliuca <nicola.pagliuca at pm dot me>
# Co-Maintainer: Aethar <elliott.ashby88@gmail.com>
_basename='hyprfreeze'
pkgname="$_basename-git"
pkgver=1.2.0.r3.882ba13
pkgrel=1
pkgdesc="Utility to suspend a game process (and other programs) in Hyprland"
arch=('any')
url="https://github.com/Zerodya/hyprfreeze"
license=('GPL')
depends=('bash' 'hyprland' 'jq' 'hyprprop')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("git+$url")
md5sums=('SKIP')

package() {
    cd "$_basename"
    install -Dm755 ./$_basename "$pkgdir/usr/bin/$_basename"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$_basename/LICENSE"
	install -Dm644 ./completions/bash/hyprfreeze "$pkgdir/usr/share/bash-completion/completions/hyprfreeze"
	install -Dm644 ./completions/fish/hyprfreeze.fish "$pkgdir/usr/share/fish/completions/hyprfreeze.fish"
	install -Dm644 ./completions/zsh/_hyprfreeze "$pkgdir/usr/share/zsh/site-functions/_hyprfreeze"
}
