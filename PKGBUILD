# Maintainer: Dragoon Aethis <dragoon@dragonic.eu>
# Contributor: Oscar Morante <spacepluk@gmail.com> (original maintainer)
pkgname=substance-designer-6
pkgver=6.0.3
pkgrel=1
pkgdesc="Substance Designer 6 is a node-based non-destructive application for material authoring."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=('https://alg-releases.s3.amazonaws.com/public_releases/substance-designer/6.x/Substance_Designer-6.0.3.181-linux-x64-standard-full.rpm'
        'substance-designer-icon.png'
        'substance-designer.desktop')
noextract=()
md5sums=('b40a0cb5e2d9712a7f5ee373490227e0'
         '99b9c5d4bb59fe884839d2872396f376'
         '1a5a0216c066af7157f48c34ef750667')
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

