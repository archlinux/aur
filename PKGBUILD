# Maintainer: Harvey Tindall <hrfee@protonmail.ch>
pkgname="jfa-go-bin"
_pkgname="jfa-go"
pkgver=0.6.0
pkgrel=1
pkgdesc="A web app for managing users on Jellyfin"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/hrfee/jfa-go"
depends=('libolm')
depends_x86_64=('libayatana-appindicator')
license=('MIT')
provides=("jfa-go")
conflicts=("jfa-go")
replaces=()
backup=()
options=()
install=
changelog=
sha256sums_x86_64=('aac91bbcf9a52171b88414261a50531f23aaee3c29a587d0a68993cb410624cb')
sha256sums_aarch64=('26ca45c9abc6d73261424c15948323c512997a608fa31ea9381a2852e8c005c7')
sha256sums_armv6h=('75f8eb46047aa556698da91867ec701e2461db9b121c5c085d6ef28662ed9c85')
sha256sums_armv7h=('75f8eb46047aa556698da91867ec701e2461db9b121c5c085d6ef28662ed9c85')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_TrayIcon_Linux_x86_64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_MatrixE2EE_Linux_arm64.zip")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_MatrixE2EE_Linux_arm.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_MatrixE2EE_Linux_arm.zip")


package() {
    install -d -m755 "$pkgdir"/usr/bin
    cd "${srcdir}"
    install -Dm755 ${_pkgname} -t "$pkgdir"/usr/bin
    chown root "$pkgdir"/usr/bin/${_pkgname}
    mkdir -p "$pkgdir"/usr/share/licenses
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
