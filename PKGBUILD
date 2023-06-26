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

pkgver=2.3.2
pkgrel=1
url="https://github.com/gene-git/dual-root"

arch=(any)
license=(MIT)

# tomli only needed for python < 3.11
depends=('python>3.9' 'efibootmgr' 'util-linux' 'rsync' 'inotify-tools' 'python-tomli')
makedepends=('git')

# See mkpkg https://github.com/gene-git/Arch-mkpkg
_mkpkg_depends=('python>minor')
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
