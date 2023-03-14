# Maintainer: BrLi <brli@chakralinux.org>
# Maintainer: xatier

_base_name=jf-openhuninn
_repo=open-huninn-font
pkgname=ttf-${_base_name}
pkgver=2.0
pkgrel=2
pkgdesc='An opensource Chinese font by justfont, based on Kosugi Maru and Varela Round'
arch=('any')
url='https://justfont.com/huninn/'
license=('OFL')
source=("https://github.com/justfont/${_repo}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('aab98f5b649c8d60b23dca506f3b1401dbc6fcd4d91e1e8509bc4ef4544bdafd')

package() {
  cd "${_repo}-${pkgver}"

  install -Dm644 "font/${_base_name}-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_base_name}.ttf"
  install -Dm644 font/* "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/doc/${_base_name}/glyphs-chart/"
  install -d "${pkgdir}/usr/share/doc/${_base_name}/image/"
  install -m644 glyphs-chart/* "${pkgdir}/usr/share/doc/${_base_name}/glyphs-chart/"
  install -m644 image/* "${pkgdir}/usr/share/doc/${_base_name}/image/"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
