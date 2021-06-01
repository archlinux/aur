# Maintainer: micouy <m.powierza@tutanota.com>
pkgname=kn
pkgver=0.2.2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="`cd` alternative. Navigate by typing abbreviation of paths."
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/micouy/kn
    rm "$pkgdir/.crates2.json"
    rm "$pkgdir/.crates.toml"
    
    [ -f ~/.bashrc ] && echo "eval \"\$(_kn init bash)\""
    [ -f ~/.zshrc ] && echo "eval \"\$(_kn init zsh)\""
    [ -f ~/.config/fish/config.fish ] && echo "_kn init fish | source"
}
