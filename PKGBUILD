# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Kalani Helekunihi <i [at] am [dot] guru>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname="xteve"
pkgname="${_pkgname}-bin"
pkgver=2.2.0.200
_abbrev="1834200"
pkgrel=1
pkgdesc="M3U Proxy for Plex DVR and Emby Live TV"
arch=('x86_64' 'aarch64')
url="https://${_pkgname}.de"
_url_1="https://github.com/${_pkgname}-project/xTeVe"
_url_2="https://github.com/${_pkgname}-project/xTeVe-Downloads"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${_url_1}/raw/${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url_1}/raw/${pkgver}/LICENSE"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.user.service")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url_2}/raw/${_abbrev}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url_2}/raw/${_abbrev}/${_pkgname}_linux_arm64.tar.gz")
sha256sums=('2d5d843d74398dccf4118b5d3d94b9bc7493e998f8131e5692857cae96aa91fd'
            '73675737cb54a8b37ca515105f97720a68c98331b713823d75620048e62c6098'
            '570965920431d4450c5057a8e00afa4b6b8e60cdf1db2c488c5ff87816175dc8'
            '05e7a0bf269542119455a4dfe2f86dbcaa753af1693da81ce648323d7a6b4af6'
            'd30449b1210c51b05e21da7eab4c9c24b02ac61c9f666134c9b7f18bc0c3e72f'
            'a71fb27b789b880a05b47e5e266fda12a7ad62cf371a306678e0df4dd8d8b494')
sha256sums_x86_64=('4fbe2999fe8fa80196060321eeabd76fda80aed713022769f0c2d45b20c0d107')
sha256sums_aarch64=('6401e91661781e3175bef08297c4b2990f3bfcf340077b8e0ae1d4f28a5ece17')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"              "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md-${pkgver}"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${_pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${_pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${_pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
