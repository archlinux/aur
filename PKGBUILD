# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.22.2
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
sha512sums_x86_64=('fe33784789e746b2643d55553e2968c58f28e7d094f2f619998e341c6296e9f1ee059e11faf57423172450892e7dc3ae933505f424ed78ed407c8de76020ac07')
sha512sums_i686=('9ceea49ccdf001fdeb710e35bfee1dd37dd74ef0b6111cd8f5401e5d5e4c9bcf313da0db3f3b273314cc9fae3f4d1c75566da21f44522cfa74e7cf2c963035e6')
sha512sums_aarch64=('ea66c37371a25992d9198c93ea9ef9b5da64fdb1898acf0e0f29463e7a9c03b476d7b40250e868b943a581c312f9ba03475d000d76771023b17edf09f7e017b0')
sha512sums_arm6h=('9ac96e51c333ff1defdc520f293d07700d045e2bcb8237666bd21b326a7510a383f6b02eeedb0cbc4ea212ad0459a8a18b0dacce85a6a1212249924451ec95c6')
sha512sums_arm7h=('42eefda2b3e02a3d75fdfb9ac40cf0c2eae0580dd161d9d1f5169f820d9840fcc36c966930fe24b1a10590217d07a5160ce7406dc7e2e5d7087bce576ef35340')


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
