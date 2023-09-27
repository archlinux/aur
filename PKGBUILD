#
# PKGBUILD for dual-root  
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='dual-root'
pkgdesc='Dual Root Tools for Managing dual esp systems'
_gitname='dual-root'

pkgver=2.9.0
pkgrel=1
url="https://github.com/gene-git/dual-root"

arch=(any)
license=(MIT)

# tomli only needed for python < 3.11
# To build docs uncomment sphinx/texlive
depends=('python>3.9' 'efibootmgr' 'util-linux' 'rsync' 'inotify-tools' 'python-tomli'
        #'python-sphinx' 'texlive-latexextra' # Docs
        )
makedepends=('git')

# See mkpkg https://github.com/gene-git/Arch-mkpkg
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${_gitname}"
    #
    # To build Docs - uncomment these and sphinx makedepends above
#    echo "Build docs"
#    cd ./Docs
#    make html
#    make latexpdf
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
