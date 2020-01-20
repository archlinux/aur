# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.23.1
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
sha512sums_x86_64=('7f1ed2a0f182b046495bea47c21fa3da301eb0d2b1e4b355dd9ed4b527f107abb329bd7306b2801d6d4e5b361066cb97c9ac7f1188306a800845c67370e4e079')
sha512sums_i686=('89a016cd63322d6263c13ee2f3ae58de3980d00b0f9c5ff5ad0c3c297792a3450c834aec4bcde234f1db8819f57b4ca3e062c3ff090cdd3dbeb4e5fc9b30938b')
sha512sums_aarch64=('04bc61bb70c3d2257edb23ed29b56f5145ef00d8bfd413db7beb3f029724f778c0abfab45345bc2c72540c39c4dbc8b43b980498453721fcf0fceecaad5e7e4d')
sha512sums_arm6h=('007ff4baf8d75f302f2ff18ce83ac917714d71e9641e914f6c881d4d4a59215195289ac0525dff0fb1b584eee00930bcefb87b1bb2472792c622c70192011ece')
sha512sums_arm7h=('6be9f20b9ee92b2a886e61c6f3aa094f85adbaaea3de21d7748dac628e2c923cf21a6e81d22fbf839a663d6baf2cbcdf469e5c47fabf5fc2ddc5885cc4324bfa')


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
