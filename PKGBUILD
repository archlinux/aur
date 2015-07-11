# contributor: tantalum <tantalum at online dot de>
pkgname=guile-lib
pkgver=0.2.2
pkgrel=1
pkgdesc='Repository of useful code written in Guile Scheme'
arch=(i686 x86_64)
license=("GPL3 and LGPL3")
depends=(guile)
url=http://www.nongnu.org/guile-lib/
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=(77427e4ff3f2b1061bffa370666125f7)
build(){
 cd ${srcdir}/${pkgname}-${pkgver} &&

 ./configure --prefix=/usr || return 1
 make && make DESTDIR=${pkgdir} install || return 1

 #remove documentation
 if [ -e ${pkgdir}/usr/share/info/dir ]; then
  rm ${pkgdir}/usr/share/info/dir
 fi
}
