# Maintainer: Matthias Lisin <ml@visu.li>
_pkgname=golangci-lint
pkgname=${_pkgname}-bin
pkgdesc="Linters Runner for Go. 5x faster than gometalinter. (Binary)"
pkgver=1.16.0
pkgrel=1
arch=('x86_64' 'i686')
url=https://github.com/golangci/golangci-lint
license=('GPL3')
provides=('golangci-lint')
conflicts=('golangci-lint' 'golangci-lint-git')

_source=${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux
source_x86_64=(${_source}-amd64.tar.gz)
source_i686=(${_source}-386.tar.gz)
sha512sums_x86_64=('dd2a24eca0beabed146bc803d759bbc1648ef6931a27e60c5f8eb668f85abb398c90facfa76dcbd4abb9e55556f6eefb3b07761c6734480d7fe34a8f676139f4')
sha512sums_i686=('206e65bd51509e4cda2ff16523f7f0317146b63fb8b8ab301ec90fe9496e54e05006e86f1595427b5f9dc4d008074f48ddc6371a622400af868d85bd07f79201')

if [[ $CARCH == "i686" ]]; then
    _dirname=${_pkgname}-${pkgver}-linux-386
else
    _dirname=${_pkgname}-${pkgver}-linux-amd64
fi

package() {
    install -Dm755 "$_dirname/golangci-lint" "$pkgdir/usr/bin/golangci-lint"
}
