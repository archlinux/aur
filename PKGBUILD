# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=mythes-nb
_LOver=6.1.3
pkgver=6.1.3.2
pkgrel=1
pkgdesc='Norwegian thesaurus'
arch=('any')
url='http://no.speling.org/'
license=('GPL')
depends=('mythes')
source=("https://download.documentfoundation.org/libreoffice/src/${_LOver}/libreoffice-dictionaries-${pkgver}.tar.xz")
md5sums=('716e3e91be00cee5f1c4fac15d94a867')

build() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/no/"
  th_gen_idx.pl < th_nb_NO_v2.dat > th_nb_NO_v2.idx
}

package() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/no/"
  install -dm755 ${pkgdir}/usr/share/mythes
  install -m644 th_nb_NO_v2.dat $pkgdir/usr/share/mythes
  install -m644 th_nb_NO_v2.idx $pkgdir/usr/share/mythes
}

