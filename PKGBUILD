# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
# Based on hunspell-* PKGBUILDs

pkgname=hunspell-eo
pkgver=20100216
pkgrel=1
pkgdesc="Esperanto hunspell dictionary"
arch=(any)
url="http://www.esperantilo.org/"
license=('GPL2')
optdepends=('hunspell:  the spell checking libraries and apps')
source=("http://www.esperantilo.org/literumilo-fontoj.tar.gz")
md5sums=('a190ad0995cb13b307ba968e7662ee9c')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 literumilo-fontoj/eo_cxorig.dic ${pkgdir}/usr/share/hunspell/eo.dic
  install -m644 literumilo-fontoj/eo_cxorig.aff ${pkgdir}/usr/share/hunspell/eo.aff

  pushd ${pkgdir}/usr/share/hunspell/

  popd

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd
}
