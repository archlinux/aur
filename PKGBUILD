# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosu
pkgname=${_pkgbase}-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Native osu! telemetry daemon with a local dashboard'
arch=('x86_64')
url='https://github.com/18-lab-dev/vosu'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libelf' 'zlib' 'libcap' 'icu' 'hicolor-icon-theme')
makedepends=('libarchive')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip')
install=vosu.install
_pkgfile="${_pkgbase}-${pkgver}-1-${CARCH}.pkg.tar.zst"
source=("${_pkgfile}::${url}/releases/download/v${pkgver}/${_pkgfile}")
sha256sums=('df5b72ab56a5b30188243e36fba048c47e2e52336c868f412d5a1366c33f1b08')

package() {
    bsdtar -xf "${srcdir}/${_pkgfile}" \
        --exclude .BUILDINFO \
        --exclude .MTREE \
        --exclude .PKGINFO \
        -C "${pkgdir}"
}

