# Maintainer: Junxuan Liao <mikeljx at 126 dot com>

pkgname=vim-just-git
_pkgname=vim-just
pkgver=r381.e0978aa
pkgrel=1
pkgdesc='Vim syntax files for justfiles'
url='https://github.com/NoahTheDuke/vim-just'
arch=('any')
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+$url.git")
sha512sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd ${_pkgname}
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm 755 "${pkgdir}/usr/share/vim/vimfiles"
    cp -dr --no-preserve=ownership {ftdetect,ftplugin,indent,syntax} \
        "${pkgdir}/usr/share/vim/vimfiles"
}
