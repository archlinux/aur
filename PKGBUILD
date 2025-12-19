# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=qui
pkgname="${_pkgname}-bin"
pkgver=1.11.0
pkgrel=1
pkgdesc="A modern alternative webUI for qBittorrent (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/autobrr/qui"
license=('GPL')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz"
  "${_pkgname}.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.tmpfiles"
)

sha256sums=('a85ee380f0d5891678cf589b835a2500dc7432f091059056f24ec10bb0a27d72'
            'd52299510cf4845f0514eefd492b01c33bc2cd2819c2be9dc157f50f67462bd2'
            'ac49b4d6ae748334f7fa360d8dd58c7cd09ba5e062249666ab380d451b7925dd'
            '3bacde8867fbb7b6d566666b635589579c1cc079cd23418284f43a7b37f0c41b')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
