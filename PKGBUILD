# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=densify
pkgver=0.3.1
pkgrel=2
pkgdesc='GTK+ application to easily compress pdf files using Ghostscript'
arch=('any')
url='https://github.com/hkdb/Densify'
license=('MIT')
depends=('ghostscript' 'python-gobject')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-wrapper.sh"
        "${pkgname}.desktop")
sha256sums=('593108c30551efc82db7e3931714e3b2571e86ab93b4aef4a711ac610ce67ae0'
            '94899515d0f8ac7dce949af48c41154a05fbd04929146662952a9c7e5b34fccc'
            'ed4177aac0538ffb8d814c0542a938f9f98fa8ef0239db3d540c3ad7da7f392e')

package() {
  install -Dm755 "${pkgname}-wrapper.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cd "Densify-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -Dm644 'desktop-icon.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 'header.png' "${pkgdir}/usr/share/${pkgname}/header.png"
  install -Dm644 'icon.png' "${pkgdir}/usr/share/${pkgname}/icon.png"
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: