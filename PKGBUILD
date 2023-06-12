# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='emv-cap'
pkgver="1.6"
pkgrel=1
pkgdesc='EMV CAP implementation in python'
url='https://sites.uclouvain.be/EMV-CAP/Application/'
license=('GPL3')

source=(
 'https://github.com/doegox/EMV-CAP/archive/d28dbdd77b57fe2489d0f3d452a5b716a0852949.zip'
)
sha512sums=('73a4cbb1d06342bbf5cbbb923581356f66d68db2b887388922e01093fc374c9e6841238e26d0cb3586a652579d83d348b3c2957f555318300e7d921d01667532')
arch=('any')
depends=(
 'python'
 'python-crypto'
 'python-pyscard'
)
makedepends=(
 'python-setuptools'
)

build() {
#  cd "$srcdir"/EMVCAP-$pkgver
 cd "$srcdir"/EMV-CAP-d28dbdd77b57fe2489d0f3d452a5b716a0852949
 python setup.py build
}

package() {
#  cd "$srcdir"/EMVCAP-$pkgver
 cd "$srcdir"/EMV-CAP-d28dbdd77b57fe2489d0f3d452a5b716a0852949
 python setup.py install --root="$pkgdir"/ --optimize=1
 sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python|" \
  $(find "${pkgdir}" -name '*.py')
}
