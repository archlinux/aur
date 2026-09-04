#
# Arch Linux PKGBUILD for dmarc_rpt 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='dmarc_report'
pkgdesc='"Generate human readable DMARC and TLS reports from standard email reports.'
_gitname='dmarc_report'

pkgver="7.1.1"
pkgrel=1
url="https://github.com/gene-git/dmarc_report"

arch=(any)
license=(GPL-2.0-or-later)
depends=(
    'python>=3.14' 
    'python-dateutil' 
    'python-lxml' 
    'py-cidr>=5.0.0' 
    'python-tomli-w'
)
# To build docs uncommont sphinx/texlive
makedepends=(
    'git'
    'meson'
    'meson-python'
    'rsync'
)
_mkpkg_depends=(
    'python>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD, dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

changelog="Changelog"

build() {
    cd "${_gitname}"

    ./scripts/do-build
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
