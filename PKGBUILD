# Maintainer: taotieren <admin@taotieren.com>

pkgbase=vim-pangu-git
pkgname=vim-pangu-git
pkgver=1.2.0.r11.gb721011
pkgrel=2
pkgdesc="『盘古之白』中文排版自动规范化的 Vim 插件"
arch=(any)
url="https://github.com/hotoo/pangu.vim"
license=('unknow')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(vim)
makedepends=(git)
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -dm755 ${_installpath}

    cd "${srcdir}"/${pkgname}
    cp -r  doc plugin "${_installpath}"

#     install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
