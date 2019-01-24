# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.13.1
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
sha512sums_x86_64=('3b6436ed376c83adf316adfb4fba0cf31b9f08a623fdd5a19692e76f6b3a9b39bed3916b9a3a55da9c5aae28a094e38f13f1949997ab11dfdf54a7c6e8144114')
sha512sums_i686=('bf3c15e74e528f2b614124d19ebd25e582f840723126b3053e666b79b09184b70eb4ac35d865adc311f20e56b155e73b283663c86d14e89d6e63b2c3aff06141')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
