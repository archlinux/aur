# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>
pkgname=substance-painter
pkgver=2017.2.0
pkgrel=2
pkgdesc="3D painting software allowing you to texture, render and share your work."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-painter'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip' '!optipng') # PNG assets here should be left untouched!
source=('https://download.allegorithmic.com/substance-painter/2017.x/Substance_Painter-2017.2.0-1.el6.standard.full.x86_64.rpm'
        'substance-painter-icon.png'
        'substance-painter.desktop'
        'substance-painter')
noextract=()
sha256sums=('940d4c3ed7458d9c6126302a8de00f28870e9b7767f898b3b99d55633d515d12'
            '6744c1fbe8e9fb1fb91bd291e3ef8ac645bbfec1aa97915f440e6fbfebf4edbd'
            '70d973bbc0459f80285a52d6054c2ac72ab2e639c4c7dc42ca1dad81ef892d1d'
            'e736a5e160be09cfe1588d349084e2f769815687db080b8c7b790e8751f185f1')
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
