# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.19.1
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
sha512sums_x86_64=('f615152e4b5b21bcda03f9d7c6e2e482c09c60c968259cfde39f8930ec7e54f587cbb87aa1021496d59181ae23415093ffc3a8cf5efaf08cb2a5e0619dac1303')
sha512sums_i686=('d5efcc59ffdcbfdeef81cd174bbbb950ab65795b925fad86ee411b3c1833a94f7776a3b1bfde9d5f38d675ad5a1f2b426b811097de3ed04df2e54642b2c24fce')
sha512sums_aarch64=('56a062b329c2479e922d7f9a19bfac9a5a17731edd8a5adb394f11f42f268f94e1052b9ce66e0bc5b6f14343017a0fb80ba508994b785ead47bf2b1c9a8dc140')
sha512sums_arm6h=('e7be28c67a26d6ac7dc72d9f295bd6effa4351286e567762f19ffe34192c2788a65f0986e7326ef9af3ed2a2aa6fa2c429d68fa17fe3c496bd56335303771ce8')
sha512sums_arm7h=('dbc0bc27feca531585329e67c0b7beb52eee2cb7721d456310733b21164772a104b2f10fef82a0b894cf15fa32e27daf19f7aa9dde80588ee3192c0dbd0428e4')


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
