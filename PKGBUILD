# Maintainer: Oscar Morante <spacepluk@gmail.com>
pkgname=substance-painter
pkgver=2017.2
pkgrel=1
pkgdesc="Substance Painter is a 3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=('https://alg-releases.s3.amazonaws.com/public_releases/substance-painter/2017.x/Substance_Painter-2017.2.0-1.el6.standard.full.x86_64.rpm'
        'substance-painter-icon.png'
        'substance-painter.desktop'
        'substance-painter')
noextract=()
md5sums=('21262cdec1600609edc81c11cf6013a8'
         'd5715b07d3b99cc2083b9e09f9f3fb20'
         '1ca4766b0d74e3a516c9cd982fefd57a'
         '6e0609c61174fce165702694b9abd292')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Painter ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Painter/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Painter/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-painter.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-painter-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-painter"
}

