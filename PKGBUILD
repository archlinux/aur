# Maintainer: M0Rf30
  
pkgname=libreengineering
pkgver=0.5.0
pkgrel=1
pkgdesc='A suite of instrumentation, electrical, mechanical, process engineering calculation and design programs and other tools.'
url='http://libreeng.sourceforge.net/'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'python2-pyqt4' 'python2-pyenchant' 'python2-pysqlite' 'python2-sqlalchemy')
optdepends=('hunspell: required for Translit only')
source=("http://downloads.sourceforge.net/project/libreeng/LibreEngineering-${pkgver}.tar.bz2"
	'libreengineering.sh')

package() {
    cd ${srcdir}
    mkdir $pkgdir/opt
    cp -r LibreEngineering-${pkgver} $pkgdir/opt/libreeng
    cd $pkgdir/opt/libreeng
    python2 -m compileall .
    cd ${srcdir}
    install -Dm755 libreengineering.sh $pkgdir/usr/bin/libreengineering
    chmod +x $pkgdir/usr/bin/libreengineering
}

md5sums=('75fc0abf74619c0343b571287bd9f4a9'
         '4598d1adaf2629c19e319e48316c77fb')
