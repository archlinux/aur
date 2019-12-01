# Maintainer: François Magimel <magimel.francois at gmail dit com>
# Contributor: doorknob60 <doorknob60 at gmail dot com>

pkgname=fofix
pkgver=3.122
pkgrel=1
pkgdesc="Frets on Fire X (FoFiX). Highly improved version of Frets on Fire"
url="https://github.com/fofix/fofix"
arch=(any)
license=('GPL')
install=${pkgname}.install
groups=('games')
depends=(
  'python2'
  'python2-pygame'
  'python2-opengl'
  'python2-numpy'
  'python2-imaging'
  'python2-pysqlite'
  'libffi'
)
replaces=('fofix')
source=(
  'https://github.com/fofix/fofix/archive/v3.122.tar.gz'
  'fofix.desktop'
  'fofix.png'
)
md5sums=('e8ec6f5e9fa4c39bd5b23a0c9fd8f864'
         'e26fc0ae8f5ca5d9bdbeb34535bacd9a'
         'f886a7fdfa7592b50aa9f62901910e03')

package() {
    install -d $pkgdir/usr/
    install -d $pkgdir/usr/share/
    install -d $pkgdir/usr/share/applications/
    install -d $pkgdir/usr/share/pixmaps/
    install -d $pkgdir/usr/bin/
    install -d $pkgdir/opt/
    cd ${srcdir}
    cp fofix.desktop ${pkgdir}/usr/share/applications/
    cp fofix.png ${pkgdir}/usr/share/pixmaps/
    mv ${srcdir}/${pkgname}-${pkgver} $pkgdir/opt/fofix
    cd $pkgdir/usr/bin/
    echo "#!/bin/sh" > fofix
    echo "cd /opt/fofix/src/" >> fofix
    echo "python2 ./FoFiX.py" >> fofix
    chmod +x fofix
    chmod -R 777 $pkgdir/opt/fofix
}
