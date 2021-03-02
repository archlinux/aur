# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go-bin"
_pkgname="jfa-go"
pkgver=0.3.1
pkgrel=2
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

sha256sums_x86_64=('a71805b047e2b76500fb630830655170f76ed0a4616ebdc27d6e3461605b971d')
sha256sums_aarch64=('ef04eac31e88281ed029fecff16cdcff0dba7edb7eca9ba5fe2671dcb3c76842')
sha256sums_armv6h=('73109d88f53115e01e2184d94ec582ae166ba56b062c1d35952e06c7a848ef2b')
sha256sums_armv7h=('73109d88f53115e01e2184d94ec582ae166ba56b062c1d35952e06c7a848ef2b')

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
