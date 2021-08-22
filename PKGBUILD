# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go-bin"
_pkgname="jfa-go"
pkgver=0.3.8
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
sha256sums_x86_64=('e127901e005d8dc539e8835b72915496fda1f39d888595a585e3a679ecaed713')
sha256sums_aarch64=('14329bfe4d4fd46cdd56dbca928fc0b218b1628abfa3b9d70847fe79251d7e3b')
sha256sums_armv6h=('d5112897ed2857b23534a667228b72b69dc7df58afe4b92f40dc37976de73857')
sha256sums_armv7h=('d5112897ed2857b23534a667228b72b69dc7df58afe4b92f40dc37976de73857')

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
