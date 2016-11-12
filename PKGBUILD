# Maintainer: Oscar Morante <spacepluk@gmail.com>
pkgname=substance-painter
pkgver=2.3.0
pkgrel=1
pkgdesc="Substance Painter is a 3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff3')
options=('!strip')
source=('https://alg-releases.s3.amazonaws.com/public_releases/substance-painter/2.x/Substance_Painter_2-2.3.0-1.el6.standard.full.x86_64.rpm'
        'substance-painter-icon.png'
        'substance-painter.desktop'
        'substance-painter')
noextract=()
md5sums=('49119c72800b0e2547baf0c830c42240'
         'd5715b07d3b99cc2083b9e09f9f3fb20'
         '1692487754dc28788c30f7d7d469a1dd'
         '2f33ebbfed213eb3e692e5f366af526e')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Painter_2 ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Painter_2/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Painter_2/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-painter.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-painter-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-painter"
}

