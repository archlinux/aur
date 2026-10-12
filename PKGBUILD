# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosulay
pkgname=${_pkgbase}-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='In-game overlay for vosu and tosu-compatible counters (binary release)'
arch=('x86_64')
url='https://github.com/shiruviaa/vosulay'
license=('MIT' 'BSD-3-Clause' 'CC-BY-4.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'wayland'
    'hicolor-icon-theme'
)
makedepends=('libarchive')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip' '!debug')
_pkgfile="${_pkgbase}-${pkgver}-1-${CARCH}.pkg.tar.zst"
source=("${_pkgfile}::https://github.com/shiruviaa/vosulay/releases/download/v${pkgver}/${_pkgfile}")
sha256sums=('1f0680adbc92c37e2641ce86df2fd444b85b550c361d40b3bd14fdbd69cac4e6')

package() {
    bsdtar -xf "${srcdir}/${_pkgfile}" \
        --exclude .BUILDINFO \
        --exclude .MTREE \
        --exclude .PKGINFO \
        -C "${pkgdir}"
}
