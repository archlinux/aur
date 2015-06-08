# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=manserver
pkgver=1.08
pkgrel=4
pkgdesc="Man to HTML converter which can act as an HTTP server on port 8888"
arch=('i686' 'x86_64')
url="http://www.squarebox.co.uk/users/rolf/download/manServer.shtml"
license=('custom')
depends=('perl')
optdeps=('gzip: extraction' 'bzip2: extraction')
source=(http://www.squarebox.co.uk/download/$pkgname-$pkgver.tar.gz
	manserver.sh manserver.service manserver.rc manpath.config)

package() {
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/systemd/system
  mkdir -p "$pkgdir"/etc/rc.d

  cd "$srcdir"/manServer
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 manServer.1 "$pkgdir"/usr/share/man/man1/manServer.1
  install -Dm755 manServer.pl "$pkgdir"/usr/bin/manServer
  install -Dm755 ../manserver.sh "$pkgdir"/usr/bin/manserver
  install -Dm644 ../manserver.service "$pkgdir"/usr/lib/systemd/system/manserver.service
  install -Dm755 ../manserver.rc "$pkgdir"/etc/rc.d/manserver
  install -Dm644 ../manpath.config "$pkgdir"/etc/manpath.config
}

md5sums=('a506e0be8eb47ff5661aa9b16bb3135c' 'aad616695f21d344fddde257876d80c3' '857f1784b306aa236ac433377643e04e' '6bc451bd812fec0703d9ea7f792761a3' '715455f372831b1d95133a6a54311c20')
