# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosulay
pkgname=${_pkgbase}-bin
pkgver=1.5.2
pkgrel=1
pkgdesc='In-game overlay for vosu and tosu-compatible counters (binary release)'
arch=('x86_64')
url='https://github.com/18-lab-dev/vosulay'
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
source=("${_pkgfile}::${url}/releases/download/v${pkgver}/${_pkgfile}")
sha256sums=('79f562834ebe1b43de696dff3072984fc800974bda6c705e26056dc106ccc29a')

package() {
    bsdtar -xf "${srcdir}/${_pkgfile}" \
        --exclude .BUILDINFO \
        --exclude .MTREE \
        --exclude .PKGINFO \
        -C "${pkgdir}"
}
