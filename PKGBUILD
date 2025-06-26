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

pkgver=3.6.0
pkgrel=1
url="https://github.com/gene-git/dual-root"

arch=(any)
license=(MIT)

# To build docs uncomment sphinx/texlive
depends=('python>=3.13' 'efibootmgr' 'util-linux' 'rsync' 'inotify-tools' 
         'python-psutil'
        #'python-sphinx' 'texlive-latexextra' # Docs
        )
makedepends=('git')

# See mkpkg https://github.com/gene-git/Arch-mkpkg
_mkpkg_depends=('python>minor')

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
