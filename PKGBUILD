# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go-bin"
_pkgname="jfa-go"
pkgver=0.3.7
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
sha256sums_x86_64=('864474ee6feab3b6e44c9bee9992adbd20e77d6bc823c7c9dfea625c82d266cd')
sha256sums_aarch64=('1fe02223a01f196bbed515f58c6c31692279dfd49d73b7a13a4eda91bcd75471')
sha256sums_armv6h=('cc5effd40ab4a2251579a699564bcd03e977f362ccf5ab89471aa43d4a42d5ee')
sha256sums_armv7h=('cc5effd40ab4a2251579a699564bcd03e977f362ccf5ab89471aa43d4a42d5ee')

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
