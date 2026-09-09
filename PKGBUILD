# Maintainer: moyigeek <moyi@openatom.club>

pkgname=atomgit-cli-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="AtomGit CLI (ag) - 基于 AtomGit API 的命令行工具，参考 GitHub CLI (gh) 开发 (binary release)"
arch=('x86_64' 'aarch64' 'loong64')
url="https://atomgit.com/hust-open-atom-club/atomgit-cli"
license=('custom:MulanPSL-2.0')
provides=('ag')
conflicts=('ag')
_sha256sums_x86_64='3b8899c471270bb50618124aeb57e92c7ef124f3f1daefd2b9c77376a03324de'
_sha256sums_aarch64='485e41c49a8a7c9cc4bd041b8d7e4e545b0eeca4cd36c50e207807a3e7d448c9'
_sha256sums_loong64='d9c2d3dfa637d120722aaf1f535bbf9de113f5b1569a327e4c3877506873da48'

case "$CARCH" in
    x86_64)  _arch=amd64   ;;
    aarch64) _arch=arm64   ;;
    loong64) _arch=loong64 ;;
    *) _arch=unknown ;;
esac

source=("https://atomgit.com/hust-open-atom-club/atomgit-cli/releases/download/v${pkgver}/ag_linux_${_arch}.tar.gz")

case "$CARCH" in
    x86_64)  _sha256=$_sha256sums_x86_64 ;;
    aarch64) _sha256=$_sha256sums_aarch64 ;;
    loong64) _sha256=$_sha256sums_loong64 ;;
    *) _sha256=SKIP ;;
esac
sha256sums=("$_sha256")

package() {
    cd "${srcdir}"
    install -Dm755 "ag" "${pkgdir}/usr/bin/ag"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
