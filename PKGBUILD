# Maintainer: LAA
pkgname=bupdate-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Universal package updater — parallel updates for Linux, BSD and Windows (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://app.radicle.xyz/nodes/iris.radicle.xyz/rad:z1SpYG13iEYC9Ds1UjyVJhe1sf1i"
license=('custom:ANTL-2.0')
provides=('bupdate')
conflicts=('bupdate' 'bupdate-git')
depends=()
optdepends=(
    'sudo: privilege elevation for system package managers'
    'systemd: sleep inhibition during updates'
)
_dlbase="https://codeberg.org/LAA/bupdate/releases/download/v${pkgver}"
source_x86_64=("bupdate-linux-amd64-${pkgver}::${_dlbase}/bupdate-linux-amd64")
source_aarch64=("bupdate-linux-arm64-${pkgver}::${_dlbase}/bupdate-linux-arm64")
sha256sums_x86_64=('6af5a0de98c1cf2b67100b2c4ee0d89889665164034b0c151d559c0ac3634a52')
sha256sums_aarch64=('4df52205822484d08a465d127ca561a575de3244e3b8ca7fa2531255df4cc2f5')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/bupdate-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    else
        install -Dm755 "${srcdir}/bupdate-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/bupdate"
    fi
}
