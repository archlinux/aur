# Maintainer: Jonathan Doman <jonathan.doman@gmail.com>

pkgname=hprest
pkgver=1.2_27
pkgrel=1
pkgdesc="HP RESTful Interface Tool"
arch=('x86_64')
url="http://www8.hp.com/us/en/products/servers/proliant/restful-interface-tool.html"
license=('custom:HPSLA')
install="hprest.install"

# strip was corrupting the already stripped binary
options=('!strip')

source=("http://ftp.hp.com/pub/softlib2/software1/pubsw-linux/p1545251609/v105396/RPMS/x86_64/${pkgname}-${pkgver//_/-}.x86_64.rpm"
        "HPSLA.txt")
md5sums=('cf5b2d804479681cab6af2bb9e7e56dc'
         'e1bee1f098fdf483db8dc9b9b132bcb6')

package() {
   mv "$srcdir"/usr/{s,}bin
   cp -R "$srcdir"/{etc,usr} "$pkgdir"
   install -D -m644 HPSLA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
