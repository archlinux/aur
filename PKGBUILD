# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io
pkgname=untrunc-anthwlock-bin
_pkgname=untrunc
pkgver=d286625
pkgrel=1
pkgdesc="Restore a damaged (truncated) mp4, m4v, mov, 3gp video. Pre-built binary with bundled FFmpeg."
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/fr0stb1rd/untrunc"
license=('GPL-2.0-only')
provides=("${_pkgname}")
conflicts=('untrunc-anthwlock-cli-git' 'untrunc-git')
options=('!strip')

_releaseurl="https://github.com/fr0stb1rd/untrunc/releases/download/v1.0.0"

source_x86_64=("${_releaseurl}/untrunc-linux-amd64")
source_aarch64=("${_releaseurl}/untrunc-linux-arm64")
source_armv7h=("${_releaseurl}/untrunc-linux-armv7")
source_i686=("${_releaseurl}/untrunc-linux-i386")

sha256sums_x86_64=('266d56c11257becbdab60c60787f63a55ee07f04f1fb360d44d13f7d848eb4e8')
sha256sums_aarch64=('3dc64308ae2a9dc6962177ab25350fb8280421ab277d5fbd5c2885a109463f4d')
sha256sums_armv7h=('bba67074a0d1901c4666dd0edbf25a0707d19cb0f05adbf119d9c6b7880303ad')
sha256sums_i686=('67724adae7b2d8bc31d76d29b18a9b5c5d9151a9b16308dd241abf8021b9579e')

package() {
    case "$CARCH" in
        x86_64)  _bin="untrunc-linux-amd64" ;;
        aarch64) _bin="untrunc-linux-arm64" ;;
        armv7h)  _bin="untrunc-linux-armv7" ;;
        i686)    _bin="untrunc-linux-i386" ;;
    esac

    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/${_pkgname}"
}
