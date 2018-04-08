# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=vim-ranger-git
pkgver=3.0.r1.g733b5c2
pkgrel=1
pkgdesc="Ranger integration for vim (Git Version)"
license=('MIT')
arch=('any')
url="https://github.com/francoiscabrol/ranger.vim"
depends=('vim' 'ranger')
makedepends=('git')
groups=('vim-plugins')
source=("git+https://github.com/francoiscabrol/ranger.vim")
md5sums=('SKIP')

pkgver() {
    cd ranger.vim
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "ranger.vim/plugin/ranger.vim" \
        "${pkgdir}/usr/share/vim/vimfiles/plugin/ranger.vim"

    head -n 22 "ranger.vim/plugin/ranger.vim" > LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
