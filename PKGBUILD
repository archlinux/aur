# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.0
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
sha512sums_x86_64=('f924c47e388dd43c3210e648cf65c369c91599c337e2214e8f8a598009974ac3360369280f2ace73cb678f35c5082d2474ba2043e799287c734e9db002dd2201')
sha512sums_i686=('c3c0410028e956755b261abbcbb9ef75915cc60087d88f12e63c72f7e41a5eea2af852e3ebdbb2a10b91ac4b86b3903da95718716ec0b1e6893fd2fddb079c9f')
sha512sums_aarch64=('842dec459be0cd716fb7c28f1eb69593c03debd17c0a390f47695fc25fc4af1aebfe6028c92c16b1cc5b8972be7c9c2ecd4025121e3d0f9a0abf4efbaf55a6d6')
sha512sums_arm6h=('7cd375a147d34b98c2d5deed82abefbc233a9cf529dfc32b96de0534bfae2b130895bb94d86b205e3d213780af6e8ca97ff3e00ab3a1d264291234222dc295fc')
sha512sums_arm7h=('321a054a900de7d6254171ad2fdd5cb2eb53f4da1d68707a1d1bd647fe860059446d62891a0bdee6a7d03e44fac12e7f8d9061b61c926afb8a2bdca9273da477')


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
