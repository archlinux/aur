# Maintainer: Puqns67 <me@puqns67.icu>

_pkgbase='smiley-sans'
pkgbase="${_pkgbase}-bin"
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}" "woff2-${pkgbase}")
pkgver=1.0.0
pkgrel=1
pkgdesc='得意黑 Smiley Sans'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL')
arch=('any')

source=("${_pkgbase}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgbase}-v${pkgver}.zip"
        "LICENSE::${url}/raw/main/LICENSE")

sha512sums=('e233b4af5d95c6c94319d096b612539b37a1c80d05391b684665bb324f60bcdef23f3f9e6a58d721459bf9cc26133463028000a5124a9921cfa0f39f8ed6ff56'
            '94f0ca7615da9f263c6b612c8db0fc969150610514534bbfce2709216261020a072b59f6ce40c7cf3e63a54d29e1997a6aff89c02cf2562e2a8087cce3621489')

package_otf-smiley-sans-bin() {
  # tags
  pkgdesc+=" (otf)"
  conflicts=('otf-smiley-sans')

  # font files
  cd "${srcdir}/"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${_pkgbase}" *.otf

  # license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-smiley-sans-bin() {
  pkgdesc+=" (ttf)"
  conflicts=('ttf-smiley-sans')

  cd "${srcdir}/"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${_pkgbase}" *.ttf

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-smiley-sans-bin() {
  pkgdesc+=" (woff2)"
  conflicts=('woff2-smiley-sans')

  cd "${srcdir}/"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${_pkgbase}" *.woff2

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et: