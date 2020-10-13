# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=vim-rhubarb-git

groups=('vim-plugins')

pkgver() {
    cd "${pkgname%-git}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r74.5130596
pkgrel=2

pkgdesc='Github extension for vim-fugitive'
arch=('any')
url="https://github.com/tpope/${pkgname%-git}"
license=('custom:vim')

makedepends=('git')
depends=('vim' 'vim-fugitive')
optdepends=('hub: used instead of git if installed')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

install=vimdoc.install
source=("git+$url.git")
sha256sums=('SKIP')


package() {
    cd "${pkgname%-git}"
    install -Dm644 plugin/rhubarb.vim -t"$pkgdir/usr/share/vim/vimfiles/plugin/"
    install -Dm644 autoload/rhubarb.vim -t"$pkgdir/usr/share/vim/vimfiles/autoload/"
    install -Dm644 doc/rhubarb.txt -t"$pkgdir/usr/share/vim/vimfiles/doc/"
    install -Dm644 README.markdown -t"$pkgdir/usr/share/doc/${pkgname%-git}"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
