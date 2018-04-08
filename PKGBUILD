# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=vim-ranger
pkgver=3.0
pkgrel=1
pkgdesc="Ranger integration for vim"
license=('MIT')
arch=('any')
url="https://github.com/francoiscabrol/ranger.vim"
depends=('vim' 'ranger')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/francoiscabrol/ranger.vim/archive/${pkgver}.tar.gz")
md5sums=('f314b7e0abb8632179d2429ad16ffb68')

package() {
    install -Dm755 "ranger.vim-${pkgver}/plugin/ranger.vim" \
        "${pkgdir}/usr/share/vim/vimfiles/plugin/ranger.vim"

    head -n 22 "ranger.vim-${pkgver}/plugin/ranger.vim" > LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
