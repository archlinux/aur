# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=mythes-nb
pkgver=2.2
pkgrel=1
pkgdesc='Norwegian thesaurus'
arch=('any')
url='http://no.speling.org/'
license=('GPL')
depends=('mythes')
source=("https://alioth.debian.org/frs/download.php/file/4168/no_NO-pack2-2.2.zip")

build() {
    unzip th_nb_NO_v2.zip
}

package() {
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 th_nb_NO_v2.dat $pkgdir/usr/share/mythes
  install -m644 th_nb_NO_v2.idx $pkgdir/usr/share/mythes


  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/mythes/th_nb_NO_v2.dat ${pkgdir}/usr/share/myspell/dicts/
  ln -sv /usr/share/mythes/th_nb_NO_v2.idx ${pkgdir}/usr/share/myspell/dicts/
}

md5sums=('256d6fe2ea5f1842090d7d05e90c5383')
