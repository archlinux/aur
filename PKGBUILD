# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=ttf-adf
pkgver=20110731
pkgrel=2
pkgdesc="True Type Fonts released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('custom:GPL with font exception')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf.install
source=(
http://arkandis.tuxfamily.org/fonts/Irianis-Std-20100729.zip
http://arkandis.tuxfamily.org/fonts/Romande-Collection-20110730.zip
http://arkandis.tuxfamily.org/fonts/OrnementsADF.zip
http://arkandis.tuxfamily.org/fonts/SymbolADF.zip
)

md5sums=('b3c0b4fe19127bc93ab31382761b9ff3'
         '961d3a2bcee5666074b71ec34d086747'
         'a481b57003078d503e73a121991127d8'
         '9ee8b15af0fe9e23d55b046ce735b70f')

build() {
  # nothing to do
  true
}

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 "${srcdir}"/*/[Tt][Tt][CcFf]/*.[Tt][Tt][CcFf]   "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 "${srcdir}"/*/*/[Tt][Tt][CcFf]/*.[Tt][Tt][CcFf] "${pkgdir}"/usr/share/fonts/TTF/

  install -Dm644 "${srcdir}"/Irianis*/NOTICE.txt "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
  echo -ne "********************************************************************************\n\n" \
                                      >> "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
  cat "${srcdir}"/Romande*/NOTICE.txt >> "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
  echo -ne "********************************************************************************\n\n" \
                                      >> "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
  cat "${srcdir}"/Ornements*/NOTICE   >> "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
  echo -ne "********************************************************************************\n\n" \
                                      >> "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
  cat "${srcdir}"/Symbol*/NOTICE      >> "${pkgdir}"/usr/share/licenses/ttf-adf/LICENSE
}

