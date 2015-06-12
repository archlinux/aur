# Maintainer: Michael Schubert <mschu.dev at google mail>

pkgname=biomart
pkgver=0.8
pkgrel=1
pkgdesc="A query-oriented data management system"
arch=('i686' 'x86_64')
url="http://www.biomart.org/"
license=('LGPL')
depends=('java-runtime')
source=('ftp://ftp.ebi.ac.uk/pub/software/biomart/martj_current/martj-bin.tar.gz')
md5sums=('9381d0fd3a76652bfbebc60b209d9e0c')

package() {
  mkdir -p $pkgdir/opt/biomart
  cp -r $srcdir/martj-bin/* $pkgdir/opt/biomart/

  mkdir -p $pkgdir/usr/bin
  for L in martbuilder marteditor martexplorer martregistrydbtool martrunner martshell; do
      ln -s /opt/biomart/bin/$L.sh $pkgdir/usr/bin/$L
  done
}
