# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=hunspell-nb
pkgver=2.2
pkgrel=2
pkgdesc='Spell checking support for Norwegian'
arch=('any')
url='http://no.speling.org/'
license=('GPL')
depends=('hunspell')
source=("https://alioth-archive.debian.org/releases/spell-norwegian/spell-norwegian/2.2/no_NO-pack2-2.2.zip")

build() {
    unzip nb_NO.zip
}

package() {
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 nb_NO.aff $pkgdir/usr/share/hunspell
  install -m644 nb_NO.dic $pkgdir/usr/share/hunspell


  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/nb_NO.aff ${pkgdir}/usr/share/myspell/dicts/
  ln -sv /usr/share/hunspell/nb_NO.dic ${pkgdir}/usr/share/myspell/dicts/
}

md5sums=('256d6fe2ea5f1842090d7d05e90c5383')
