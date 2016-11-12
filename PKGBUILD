# Maintainer: Oscar Morante <spacepluk@gmail.com>
pkgname=substance-batchtools
pkgver=5.5.2.176
pkgrel=1
pkgdesc="Substance Batchtools is a set of command lines allowing you to script some of Substance Designer process."
arch=('x86_64')
url='https://support.allegorithmic.com/documentation/display/SB10/Substance+Batchtools+User%27s+Guide'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff3')
options=('!strip')
source=('https://s3.amazonaws.com/alg-releases/public_releases/batchtools/Substance_BatchTools-5.5.2.176-linux-x64-standard-full.tar.gz')
noextract=()
md5sums=('d415503b9e619bf1cd6ad1e70a68e649')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/Substance_BatchTools ${pkgdir}/opt/Allegorithmic

  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/Allegorithmic/Substance_BatchTools/sbscooker ${pkgdir}/usr/bin
  ln -s /opt/Allegorithmic/Substance_BatchTools/psdparse ${pkgdir}/usr/bin
  ln -s /opt/Allegorithmic/Substance_BatchTools/sbsbaker ${pkgdir}/usr/bin
  ln -s /opt/Allegorithmic/Substance_BatchTools/sbsrender ${pkgdir}/usr/bin
  ln -s /opt/Allegorithmic/Substance_BatchTools/sbsmutator ${pkgdir}/usr/bin

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_BatchTools/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_BatchTools/eula.txt
}

