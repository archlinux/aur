# Maintainer: clague <clague [at] clague [dot] moe>
# The address is intentionally obfuscated to keep crawlers from harvesting it.
#
# The GitHub owner/repository below are replaced automatically by the
# "Publish to AUR" workflow. For local builds, edit them or use:
#   updpkgsums && makepkg -si

_owner="clague"
_repo="ukibuild"

pkgname=ukibuild
pkgver=0.3.0
pkgrel=1
pkgdesc="Build and sign Unified Kernel Images (UKI)"
arch=('any')
url="https://github.com/${_owner}/${_repo}"
license=('MIT')
depends=(
    'bash'
    'coreutils'
    'util-linux'
    'systemd-ukify'
    'sbsigntools'
)
makedepends=('make')
optdepends=('sbctl: use sbctl as the signing backend')
backup=('etc/ukibuild.conf')
install=ukibuild.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_owner}/${_repo}/archive/v${pkgver}.tar.gz")
sha256sums=('459366d91df1c9dc8033052e3eed0d26cbbe6ea57fe23d6f7801059d7afe08ad')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
