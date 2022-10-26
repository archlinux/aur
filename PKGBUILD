#
# PKGBUILD for mkpkg 
# This builds the latest release tag.
# git HEAD is well also well tested before any repo change.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg_tool'
pkgdesc='Tool to manage wireguard server and users'
_gitname='wg_tool'

pkgver=1.1.1
pkgrel=1
url="https://github.com/gene-git/wg_tool"

arch=(any)
license=(MIT)
depends=('python>3.9' 'python-packaging')
makedepends=('git' 'python-pip' 'python-poetry' 'rsync')
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}")
sha512sums=('SKIP')

pkgver() {
     cd "${_gitname}"
     git describe --tags --abbrev=0
}

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    poetry build
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
