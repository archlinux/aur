# Maintainer: Your Name <you@example.com>

pkgname=ag-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="AtomGit CLI (ag) - 基于 AtomGit API 的命令行工具，参考 GitHub CLI (gh) 开发 (binary release)"
arch=('x86_64' 'aarch64' 'loong64')
url="https://atomgit.com/hust-open-atom-club/atomgit-cli"
license=('custom:MulanPSL-2.0')
provides=('ag')
conflicts=('ag')
_sha256sums_x86_64='065ade926a8ff44547f78eb48389b18c054edc624fbd533db71e0207f3a9a6f7'
_sha256sums_aarch64='8933a84d566fc523c4aaf8ec69bc46b6a9edcc020fd027040ec249274ad470b0'
_sha256sums_loong64='7ec065b451302ea31ea14e680638c7fb3fd8774ec19e847f7c92b72d4a25e61f'

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
