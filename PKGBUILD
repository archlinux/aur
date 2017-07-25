# Maintainer: Dragoon Aethis <dragoon@dragonic.eu>
# Contributor: Oscar Morante <spacepluk@gmail.com> (original maintainer)
pkgname=substance-designer-6
pkgver=6.0.4
pkgrel=1
pkgdesc="Node-based, non-destructive PBR material authoring tool"
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=('https://alg-releases.s3.amazonaws.com/public_releases/substance-designer/6.x/Substance_Designer-6.0.4.265-linux-x64-standard-full.rpm'
        'substance-designer-icon.png'
        'substance-designer.desktop')
noextract=()
sha256sums=('9d1d4eb21d75e77af56fb262f9dff688d0012dab646e15be4b142465162a1f52'
            '8f7f090d96dbb3535747d2c09c32970343c8887df610bc7ef92b59871a9bfb35'
            '8a39ceb81845f4ecb1049de87f3f3224299d5cfcdeb5119a3af3f0f5b14cffe0')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Designer-6 ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Designer-6/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Designer-6/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-designer.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-designer-icon.png"
}

