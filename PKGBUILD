# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=densify
_pkgname_upper=Densify
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK+ application to easily compress pdf files with Ghostscript"
arch=('any')
url="https://github.com/hkdb/${_pkgname_upper}"
license=('MIT')
source=("https://github.com/hkdb/${_pkgname_upper}/archive/v${pkgver}.tar.gz"
        "${pkgname}-wrapper.sh"
        "${pkgname}.desktop"
)
depends=('ghostscript' 'python-gobject')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('593108c30551efc82db7e3931714e3b2571e86ab93b4aef4a711ac610ce67ae0'
            '94899515d0f8ac7dce949af48c41154a05fbd04929146662952a9c7e5b34fccc'
            'ed4177aac0538ffb8d814c0542a938f9f98fa8ef0239db3d540c3ad7da7f392e'
)

package() {
  install -Dm755 "${pkgname}-wrapper.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cd "${_pkgname_upper}-${pkgver}"
  install -Dm644 'desktop-icon.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -Dm644 'header.png' "${pkgdir}/usr/share/${pkgname}/header.png"
  install -Dm644 'icon.png' "${pkgdir}/usr/share/${pkgname}/icon.png"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}