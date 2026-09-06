#
# Arch Linux PKGBUILD for pynotify 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='python-pynotify'
pkgdesc='Python Inotify Class'
_gitname='pynotify'

pkgver="2.0.0"
pkgrel=1
url="https://github.com/gene-git/pynotify"

arch=(any)
license=(GPL-2.0-or-later)

# To build docs uncommont sphinx/texlive
depends=(
    'python>=3.14'
    'glibc'
)
makedepends=(
    'git'
    'meson'
    'meson-python'
    'rsync' 
    #'python-sphinx' 'texlive-latexextra' python-sphinx-autoapi'
)
_mkpkg_depends=(
    'python>minor'
    'glibc>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${_gitname}"

    ./scripts/do-build
}

package() {
    cd "${_gitname}"
    ./scripts/do-install "${pkgdir}"
}
# vim:set ts=4 sts=4 sw=4 et:
