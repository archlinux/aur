pkgname=tabby-arch-bin
_pkgname=tabby
pkgver=1.0.168
pkgrel=1
pkgdesc="A terminal for a more modern age (formerly Terminus), native Pacman version"
arch=("x86_64")
url="https://tabby.sh/"
license=('MIT')
depends=('nodejs')
optdepends=('gnome-keyring')
provides=("tabby")
replaces=('tabby')
conflicts=('tabby' 'terminus-terminal' 'terminus-terminal-git' 'tabby-bin')
source=("https://github.com/Eugeny/tabby/releases/download/v$pkgver/$_pkgname-$pkgver-linux.pacman")
sha256sums=("87b5cdd87a01bd9cd3b8b1df041bdb9192789d0bb3ada70774304f2b25702467")

package() {
    cp -r usr/ "$pkgdir"
    cp -r opt/ "$pkgdir"
    install -Dm755 /dev/stdin "$pkgdir"/usr/bin/"$_pkgname" <<END
    #!/usr/bin/bash
    /opt/Tabby/tabby

END

}
