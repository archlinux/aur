# Maintainer: Henry-Joseph Audéoud <h.audeoud+arch@gmail.com>

pkgname=vim-ssh-annex-git
_pkgname=${pkgname%-git}
pkgver=r2.5a56f26
pkgrel=2
pkgdesc="Auxiliary vim syntax files for OpenSSH"
arch=(any)
url='https://github.com/qnighy/vim-ssh-annex'
license=(unknown)
depends=(vim-plugin-runtime)
makedepends=(git)
groups=(vim-plugins)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    _installpath="${pkgdir}/usr/share/vim/vimfiles"

    install -m644 -D -t "${_installpath}/syntax/" \
        syntax/*
    install -m644 -D -t "${_installpath}/ftdetect/" \
        ftdetect/*
}
