# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>

pkgname=untrunc-anthwlock-bin
_pkgname=untrunc
pkgver=1.0.2
pkgrel=1
pkgdesc="Restore a damaged (truncated) mp4, m4v, mov, 3gp video. Pre-built binary with bundled FFmpeg."
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/fr0stb1rd/untrunc"
license=('GPL-2.0-only')
provides=("${_pkgname}")
conflicts=('untrunc' 'untrunc-anthwlock-cli-git' 'untrunc-git')
options=('!strip')

_releaseurl="https://github.com/fr0stb1rd/untrunc/releases/download/v${pkgver}"

source_x86_64=("${_releaseurl}/untrunc-linux-amd64")
source_aarch64=("${_releaseurl}/untrunc-linux-arm64")
source_armv7h=("${_releaseurl}/untrunc-linux-armv7")
source_i686=("${_releaseurl}/untrunc-linux-i386")

sha256sums_x86_64=('125dd3fba853473e3bdf879017f0c8b594827df1b88c23ab5711f34df5259f06')
sha256sums_aarch64=('412949f522d2eac35d31e5ca3082a10fe2f92a0403ab1eb4911727855cb39920')
sha256sums_armv7h=('e1bbe1b2a1b5eaf06911e023235daab8085769fd6d3af300f5f6428560890ab9')
sha256sums_i686=('29518b8cf46ac9994ce804e93ca50bbbe113942cc2639f8a01d5917d83ac3ef7')

package() {
    case "$CARCH" in
        x86_64)  _bin="untrunc-linux-amd64" ;;
        aarch64) _bin="untrunc-linux-arm64" ;;
        armv7h)  _bin="untrunc-linux-armv7" ;;
        i686)    _bin="untrunc-linux-i386" ;;
    esac

    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/${_pkgname}"
}
