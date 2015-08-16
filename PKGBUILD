# Contributor: boteium
pkgname=fakeroute
pkgver=0.3
pkgrel=2
license=unknown
source=http://www.thoughtcrime.org/software/fakeroute/${pkgname}-${pkgver}.tar.gz
pkgdesc="a hack that makes your host appear (to unix traceroute) to be anywhere"
arch=('i686' 'x86_64')
url=http://www.thoughtcrime.org/software/fakeroute/

md5sums=('d35c1894f2774993e785825f9fd06fa2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package(){
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install


echo Usage:
echo To use fakeroute, you must define a route file with your fake route. 
echo The file should be a newline separated list of dotted quad IP addresses
echo For example, 10.0.0.34 could have a route.conf that looks like\:
echo .
echo 216.102.187.130
echo 165.87.161.74
echo .
echo traceroute to localhost \(127.0.0.1\), 30 hops max, 40 byte packets
echo  1  core4-g3-0.snfc21.pbi.net \(216.102.187.130\)  0.324 ms  0.247 ms  0.162 ms
echo  2  sfra1sr3-so-1-1-1-0.ca.us.prserv.net \(165.87.161.74\)  0.164 ms  0.265 ms  0.159 ms
echo .
echo To run, become root, and simply execute "fakeroute -f <route_file>".
echo .
sleep 1

}
