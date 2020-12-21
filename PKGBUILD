# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=emoji-cli
pkgver=r43.0fbb2e4
pkgrel=1
pkgdesc="Emoji completion on the command line for ZSH."
arch=('any')
url="https://github.com/b4b4r07/${pkgname}"
license=('MIT')
depends=('zsh' 
         'jq' 
         'fzf')
makedepends=('git')
options=('!strip')
install="emoji-cli.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm 644 "dict/emoji.json" "${pkgdir}/usr/share/zsh/plugins/${pkgname}/dict/emoji.json"
    install -Dm 644 "emoji-cli"{.plugin,}".zsh" "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
}
