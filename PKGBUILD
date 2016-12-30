# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: kagan <juanynie AT gmail DOT com>
pkgname=mfe
pkgver=0.1.7
pkgrel=4
pkgdesc="A simple, GTK+ frontend / launcher for mednafen, written in python."
url="http://sourceforge.net/projects/mednafenfe/"
license=('MIT')
depends=('python2' 'gtk2' 'pygtk' 'python2-configobj' 'mednafen')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/mednafenfe/$pkgname-$pkgver.tar.gz mfe.patch)
md5sums=(e0e257acfdb307f076e0685ba6460945 2f745e97ec71e3108d9cea68edbde32a)

build() {
cd $srcdir/$pkgname-$pkgver/
patch -p2 < $startdir/src/$pkgname.patch
}

package() {
cd $srcdir/$pkgname-$pkgver/
python2 setup.py install --root=${pkgdir} --prefix=/usr
}

