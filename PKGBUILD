# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=qui
pkgname="${_pkgname}-bin"
pkgver=1.9.0
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

sha256sums=('412268fc60cebd75aaf347c59fdbdd0da493c8236a540e22ab8b19386fd263a5'
            'd52299510cf4845f0514eefd492b01c33bc2cd2819c2be9dc157f50f67462bd2'
            'ac49b4d6ae748334f7fa360d8dd58c7cd09ba5e062249666ab380d451b7925dd'
            '3bacde8867fbb7b6d566666b635589579c1cc079cd23418284f43a7b37f0c41b')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
