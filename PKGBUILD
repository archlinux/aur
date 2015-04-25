# Maintainer: Jonathan Doman <jonathan.doman@gmail.com>

pkgname=hprest
pkgver=1.1_41
pkgrel=1
pkgdesc="HP RESTful Interface Tool"
arch=('x86_64')
url="http://www8.hp.com/us/en/products/servers/proliant/restful-interface-tool.html"
license=('custom:HPSLA')
install="hprest.install"

# strip was corrupting the already stripped binary
options=('!strip')

source=("http://ftp.hp.com/pub/softlib2/software1/pubsw-linux/p2048115036/v102552/RPMS/x86_64/${pkgname}-${pkgver//_/-}.x86_64.rpm"
        "HPSLA.txt")
md5sums=('cb84e97634c2735e3a5a4c63542141f5'
         'e1bee1f098fdf483db8dc9b9b132bcb6')

package() {
   mv "$srcdir"/usr/{s,}bin
   cp -R "$srcdir"/{etc,usr} "$pkgdir"
   install -D -m644 HPSLA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
