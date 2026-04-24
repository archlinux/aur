#
# sd-boot:
# Arch Linux PKGBUILD 
# This builds the latest release tag.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='sd-boot'
pkgdesc='Tools to install linux kernels via kernel-install from systemd'
_gitname='sd-boot'

pkgver="3.8.0"
pkgrel=1
url="https://github.com/gene-git/sd-boot"

arch=(any)
license=(GPL-2.0-or-later)

#install='sd-boot.install'

# To build docs uncommont sphinx/texlive
depends=(
    bash
    dracut
    efifs
    rsync
    systemd
)
optdepends=(
    'edk2-shell: efi-shell (installed into EFI partition'
    # 'memtest86_64-git: memtest (installed into EFI partition'   # TBD in AUR
)

makedepends=()

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C <arch@sapience.com>

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

changelog="Changelog"

package() {
    cd "${_gitname}"
    ./do-install "${pkgdir}"
}
# vim:set ts=4 sts=4 sw=4 et:

