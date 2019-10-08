# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.20.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'arm6h' 'arm7h')
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
sha512sums_x86_64=('f070dc00528773b03dab98b6501c6822989fccf210a58163e631738a00e353cef1ff9310c63b1c8260f256c4f81644c68976c03161174c11edc83c7be54f1c1d')
sha512sums_i686=('85e0e740ef30d69877ddb481699e269af02aab432577e5b7dd17830df2d2ce76d0d2e83f0a0f60ac41c7ecfb76c53c00854b5164bbd3ed295625b7bec4a382da')
sha512sums_aarch64=('1595297bbe24769a888f36cde9af4edfe179d32641f33249a636db43bcb96b9b8a4f8fccceec8ae4ecce3a8700efa5799e547bc8a6ebd22ab55ccb86915e3cb8')
sha512sums_arm6h=('09ac40051964130da572aaf052ecf1c4b8409095c6c6568801b9a1d50d0f55db887aa23368901b1afd188716b4b058b02d62bdc8e2d7b238aaa2e773e949d731')
sha512sums_arm7h=('c3c7049bbea25e01193c3db5897e31604bb775ae95195166407720f0bb4c331d7029be3bbfed60f3e66f4bf6d2a817eee92d15b7fc4632e3f2d772581f053529')


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
