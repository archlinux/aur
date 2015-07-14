# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hyphen-pt_pt'
pkgver=20040415
pkgrel=2
pkgdesc="Portuguese hyphenation rules"
arch=('any')
url="http://ftp.daum.net/openoffice/contrib/dictionaries/"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=('http://download.services.openoffice.org/contrib/dictionaries/hyph_pt_PT.zip')
md5sums=('327989bbbfc9f9d56eb772427a344eb3')

build() {
  /bin/true
}

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/hyphen
  install -m644 hyph_pt_PT.dic $pkgdir/usr/share/hyphen

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_hyph_pt_PT.txt $pkgdir/usr/share/doc/$pkgname
  
  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 README_hyph_pt_PT.txt $pkgdir/usr/share/licenses/$pkgname
}
