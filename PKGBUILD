# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.22.0
pkgrel=1
arch=(x86_64 i686 aarch64 arm6h arm7h)
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
source_aarch64=(${_source}-arm64.tar.gz)
source_arm6h=(${_source}-armv6.tar.gz)
source_arm7h=(${_source}-armv7.tar.gz)
sha512sums_x86_64=('9e85e3d924a2e187f2832e6a2a93be596e2744fb0ff3b340b78f7955dc1b78d10e6db5f111d8bb6e1fea2049e6f9bb00e59634f879f7ade1b4d1aedd51046786')
sha512sums_i686=('a1cc8e4e6ab03dbba426ec60ad1126ccb29d1812dc54402653daea30411efb0b9c0bc4b29a1b0fa1d895628bf71fe5aa9cd07c8b551a51ffd8ebd2685f3b3747')
sha512sums_aarch64=('ce3b2cc519ff07bfbce0e6ddfdc548d780af808fdf329ed0f9f16d0dde5614eead8314ca96b3636f944290fa5f364d10694ffabee208124c8416169b30f52281')
sha512sums_arm6h=('877afc6530ada8985fdccbcab1954d93bb6beb6accf978358cc5124abbfd4adfe1e075d27cd89da799a19f9c0275de37b4e041710853de43aa4ca5539fc16f88')
sha512sums_arm7h=('931d1c278f81ef29a1490d21902eceba1e4cace0f6f3402b1412ffce7121d02d14003b6acb95ada807fcb2b02a0a2819ff8297bf25660dc3b24ee771ea9354aa')


case $CARCH in
    i686) _suffix=386 ;;
    x86_64) _suffix=amd64 ;;
    aarch64) _suffix=arm64 ;;
    arm6h) _suffix=armv6 ;;
    arm7h) _suffix=armv7 ;;
esac

package() {
    install -Dm755 "${_pkgname}-${pkgver}-linux-${_suffix}/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
