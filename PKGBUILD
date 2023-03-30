# Maintainer: badcast <lmecomposer@gmail.com>
# Contributor: Artem Izmaylov <support@aimp.ru>
pkgname=aimp
pkgver=5.11
pkgrel=2427
url="https://www.aimp.ru/"
pkgdesc="AIMP (on Wine) is powerful free audio player."
arch=('x86_64')
license=('custom')
depends=('wine' 'sh' 'hicolor-icon-theme')
source=("${url}/files/linux/aimp_${pkgver}-${pkgrel}_amd64.deb"
   "${pkgname}"
   "${pkgname}.desktop")
sha256sums=('295990ef159a65292a7c44522b0401edec85f0cad068f5b0bc367ee25918dbee'
            'b41610f455db4f7600488d49d8df697e85cd554ec3be35d382fa089526f6f051'
            'bc7f27965c2dd27b483a4a8fb667b125af65343c22764082d7680bd4ce429eaa')

package(){
   bsdtar -xf "data.tar.gz" -C "${pkgdir}"
   install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${pkgdir}/opt/${pkgname}/AIMP/Assets/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
   install -Dm644 "${pkgdir}/opt/${pkgname}/AIMP/license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rtf"
   find "${pkgdir}" -type d -exec chmod 755 {} \;
   find "${pkgdir}" -type f -exec chmod 644 {} \;
   install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
}
