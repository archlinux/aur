# Maintainer: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-b2m
pkgver=3.1.4
_build=1938
pkgrel=1
pkgdesc="Image to PBR material generator."
arch=('x86_64')
url='https://www.allegorithmic.com/products/bitmap2material'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')

source=("Substance_B2M-${pkgver}-${_build}-linux-x64-standard-commercial.rpm::local://Substance_B2M-${pkgver}-${_build}-linux-x64-standard-commercial.rpm"
        'substance-b2m-icon.png'
        'substance-b2m.desktop'
        'substance-b2m')
sha256sums=('SKIP'
            '87d2e879c24a26e63334614b9f1c5d24bfb2eb2b606762b63ce5a2fe6a54345e'
            '6d6e6311cc2605b27572cec90da774dfe7def640e49881131afeaf8b1ab0bbf1'
            'd74f4435d6c75b16e72a988b2a2112aa6e6a21251b774d18372fdbc092ed2aad')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_B2M ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_B2M/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_B2M/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-b2m.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-b2m-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-b2m"
}
