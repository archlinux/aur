# Maintainer: François Magimel <magimel.francois@gmail.com>
# Contributor: doorknob60 <doorknob60 at gmail dot com>

pkgname=fofix
pkgver=3.121
pkgrel=6
pkgdesc="fretsonfire X (FoFiX). Highly improved version of Frets on Fire"
url="http://code.google.com/p/fofix"
arch=(any)
license=('GPL')
install=${pkgname}.install
groups=('games')
depends=('python2' 'python2-pygame' 'python2-opengl' 'python2-numpy' 'python2-imaging' 'pyogg' 'pyvorbis' 'python2-pysqlite' 'libffi')
replaces=('fofix')
source=('http://fofix.googlecode.com/files/fofix-3.121.tar.gz' 'fofix.desktop' 'fofix.png')
md5sums=('ce63bc8924711ab0c52cebbb1b779d7f' 'e26fc0ae8f5ca5d9bdbeb34535bacd9a' 'f886a7fdfa7592b50aa9f62901910e03')


build() {
install -d $pkgdir/usr/
install -d $pkgdir/usr/share/
install -d $pkgdir/usr/share/applications/
install -d $pkgdir/usr/share/pixmaps/
install -d $pkgdir/usr/bin/
install -d $pkgdir/opt/
cd ${srcdir}
cp ${startdir}/fofix.desktop ${pkgdir}/usr/share/applications/
cp ${startdir}/fofix.png ${pkgdir}/usr/share/pixmaps/
mv ${srcdir}/fofix-3.121 $pkgdir/opt/fofix
cd $pkgdir/usr/bin/
echo "#/bin/sh" > fofix
echo "cd /opt/fofix/src/" >> fofix
echo "python2 ./FoFiX.py" >> fofix
chmod +x fofix
chmod -R 777 $pkgdir/opt/fofix
}
