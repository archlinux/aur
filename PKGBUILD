# Maintainer: Oscar Morante <spacepluk@gmail.com>
pkgname=substance-designer
pkgver=2017.1
pkgrel=1
pkgdesc="Substance Designer is a node-based non-destructive application for material authoring."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-designer'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=('https://leyfi2.allegorithmic.com/softwares/593a68e3cbb0d9002ed3173e/builds/latest?platform=lin-rpm&download=1'
        'substance-designer-icon.png'
        'substance-designer.desktop'
        'substance-designer')
noextract=()
md5sums=('584f363dd46f94da8b52a73f347ba9bc'
         '6cbffe7041d82640a39132d8b0dbb11a'
         'f1ea38d0987175b5a4ec0f358a49bce8'
         '55a27095415c1e013649186c1a84228a')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Designer ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Designer/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Designer/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-designer.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-designer-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-designer"
}

