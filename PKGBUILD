# Maintainer: Daniel R. van Rossum <d.r.vanrossum @ gmx.de>
# Contributor: Daniel YC Lin <dlin.tw @ gmail com>
pkgname=vim-dirdiff-git
pkgver=r35.7049f50
pkgrel=1
pkgdesc="A plugin to diff and merge two directories recursively"
arch=(any)
url="https://github.com/will133/vim-dirdiff"
license=('custom')
depends=('vim')
makedepends=('git')
provides=('vim-dirdiff')
conflicts=('vim-dirdiff')
groups=('vim-plugins')
install=vimdoc.install
source=("$pkgname"::'git+https://github.com/will133/vim-dirdiff')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 ${srcdir}/$pkgname/plugin/dirdiff.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/dirdiff.vim
    install -Dm644 ${srcdir}/$pkgname/doc/dirdiff.txt    ${pkgdir}/usr/share/vim/vimfiles/doc/dirdiff.txt
    install -Dm644 ${srcdir}/$pkgname/doc/dirdiff.txt    ${pkgdir}/usr/share/licenses/${pkgname}/dirdiff.txt
}
