# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=hyphen-nb
pkgver=2.2
pkgrel=1
pkgdesc='Norwegian hyphenation rules'
arch=('any')
url='http://no.speling.org/'
depends=('hyphen')
license=('GPL')
source=("https://alioth.debian.org/frs/download.php/file/4168/no_NO-pack2-2.2.zip")

build() {
    unzip hyph_nb_NO.zip
}

package() {
  install -dm755 ${pkgdir}/usr/share/hyphen
  install -m644 hyph_nb_NO.dic $pkgdir/usr/share/hyphen


  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hyphen/hyph_nb_NO.dic ${pkgdir}/usr/share/myspell/dicts/
}

md5sums=('256d6fe2ea5f1842090d7d05e90c5383')
