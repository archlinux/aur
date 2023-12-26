# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go-bin"
_pkgname="jfa-go"
pkgver=0.5.1
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
sha256sums_x86_64=('600680a9030925952957bd8ffa7e9c0dda7866e7d4a28b0772993b0c24208b72')
sha256sums_aarch64=('b846ef3f9091db4a423225aa1b64e11c9231d02da7e40f484cf3e4d8fe3f09ef')
sha256sums_armv6h=('2a9f272e39c7b426f7c052d313296e2a1e70772d1753f3478c55b32e1a71d169')
sha256sums_armv7h=('2a9f272e39c7b426f7c052d313296e2a1e70772d1753f3478c55b32e1a71d169')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.zip")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm.zip")


package() {
    install -d -m755 "$pkgdir"/usr/bin
    cd "${srcdir}"
    install -Dm755 ${_pkgname} -t "$pkgdir"/usr/bin
    chown root "$pkgdir"/usr/bin/${_pkgname}
    mkdir -p "$pkgdir"/usr/share/licenses
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
