# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Dongsheng Cai <dongsheng at moodle {dot} com>
# Contributor: Mcder3 <mcder3[at]gmail[dot]com>

pkgname=yoono
_altpkgname=yoono-desktop
pkgver=1.8.44
pkgrel=2
pkgdesc="Allows you to connect to all your social networks and IM services"
arch=('i686' 'x86_64')
url="http://www.yoono.com"
license=('custom:yoono')
depends=('xulrunner')

source=("http://cdn.yoono.com/desktop/${_altpkgname}-${pkgver}.tar.bz2"
        "yoono"
        "yoono.desktop")

md5sums=('7581c3a52ac9292883acae7fa11eea7f'
         'c4ef2d69caac5b00d69cbfe6cb27a495'
         '723b2875156c48d89a5680b1b212af40')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "./${_altpkgname}/"* "${pkgdir}/opt/${pkgname}"

  cd "${pkgdir}/opt/${pkgname}"

  # install icon, desktop files
  install -Dm644 "${srcdir}/${_altpkgname}/chrome/branding/content/icon64.png" "${pkgdir}/usr/share/pixmaps/yoono.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
