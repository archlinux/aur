# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.2
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
sha512sums_x86_64=('fe525bc03edfa6a8961b644a64f1019462a7df1d64b7e780bdafcceca4276445bd27a5de015ea085dbde7d4688207dfdf3f3ec92ae0fcf7a17dd873df9ec8170')
sha512sums_i686=('b65427ad2400c6fc18293ea42b359b129a9f0f04210aa7a366a3d64eb742d241165226ed1ca0041b734feff25a178825cd95270cb070051b781ebb08192cbd22')
sha512sums_aarch64=('2874c7135333e4060743bfed8bf21851a17440cd61f9790f2ac85515446e137a3ad9a2e99b29457409d1c88b00fd26fabec42aab76eb70d196f1be5ad46f7069')
sha512sums_arm6h=('45a9adc04cf4128efa01bb13d4ca2f0d09c4bec8cfac9f91a16db9db938023c5aa8bb522b19ce9cfcfcb9a1e8a2cb27fddf8725b9ec11a8f0c4ca7e7622e4f98')
sha512sums_arm7h=('ba5aa7635d48a7f51cad1c4b8dbdae1fbcaa4acbebe11dbe795a0e5b72e575754650935afc6646b74633e91b96c990f196af78dd74ea71a1c7fb570df6dd019d')


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
