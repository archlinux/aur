# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go-bin"
_pkgname="jfa-go"
pkgver=0.3.3
pkgrel=1
pkgdesc="A web app for managing users on Jellyfin"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/hrfee/jfa-go"
license=('MIT')
provides=("jfa-go")
conflicts=("jfa-go")
replaces=()
backup=()
options=()
install=
changelog=
sha256sums_x86_64=('5d82c0a9efa6a5e9ac014ef5168a32ffa9ee13d1febdaa3f07aff0bc0d848abc')
sha256sums_aarch64=('8b796655ffc170b670e7ae35a0cb8690bb05823016c8f18446eb576fef3299ac')
sha256sums_armv6h=('8c0c73f825f57e5b8852bdcb2bd9df3b95a6e185561709baa892f5b237a910c6')
sha256sums_armv7h=('8c0c73f825f57e5b8852bdcb2bd9df3b95a6e185561709baa892f5b237a910c6')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")


package() {
    install -d -m755 "$pkgdir"/usr/bin
    cd "${srcdir}"
    install -Dm755 ${_pkgname} -t "$pkgdir"/usr/bin
    chown root "$pkgdir"/usr/bin/${_pkgname}
    mkdir -p "$pkgdir"/usr/share/licenses
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
