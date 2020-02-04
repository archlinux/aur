# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.3
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
sha512sums_x86_64=('69c9cbfca5ec950a1472026f368dc78f51510abfb52afb3e968d400b7e324c124c4b81a573215fc89d9e723525cd17a63511f64bf7a2df328d06345c88023ce8')
sha512sums_i686=('4092d80e181c70ae1b4416894fb4a08b6ddee4fcc05b4c980a7a6ecde35088eb5dd789b0c4034596361f9544af7331a23a03beed9abf5fee766b9f073e7fc142')
sha512sums_aarch64=('aabc49df8235aa31fd06b0b5a59a977ea100dbc8e6b8d803ae0db71b8513c987a5de8deb5553792ac1d2f2f6232d23b5398caf06eed28be353c0cf88f169e22f')
sha512sums_arm6h=('95ba003c168564e8166795637b60d2f86b32c8dbcef37de78a06290e836e06195a7c218124eed943a166c3190edd376e7883216c23718f5b11703a4adb420530')
sha512sums_arm7h=('8d6d4f033f1fe8d7b78f6bb3b9f6ca2701601ddf5a319cd58d15e1ac76adebfa7e94e13675822c0f30dfcea1cb264d6bf4f3213c0c11041ec3d26fa64bdd03d2')


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
