# Contributor: 51t <me@51t.ru>
# Maintainer: vitirk <vityairk@gmail.com>

pkgname='ii-net'
pkgver='03'
pkgdesc="russian fido-like messaging system with web interface"
pkgrel=6
arch=('any')
depends=('python2')
license=('custom')
url="http://ii.51t.ru"
source=("http://ii-net.tk/files/ii-$pkgver.tar.gz"
	"http://ii-net.tk/files/iiclient-$pkgver.tar.gz"
	"http://ii-net.tk/files/iitxt-$pkgver.tar.gz"
	"http://ii-net.tk/files/scripts.tar.gz"
)
md5sums=(
	"5d294fa75f9dd75882cc643885a98e7a"
	"e03e272a91ea5e9f3ac74aa63c7508bd"
	"19bc53a1dbc3219ab6411a6b03cf2532"
	"82e83f28a3c00362df71cfd200cac923"
)

package() {
	cd "${srcdir}"

	install -d $pkgdir/usr/share/ii-net/ii-server/{api,echo,msg,iitpl,s/{fonts,css,js/vendor},tools/{gate,mkhtml,bundle,other,client-toss}}
	install -d $pkgdir/usr/share/ii-net/ii-client/{out,clapi,sa-node,tpl,s/{fonts,css,js/vendor}}
	install -d $pkgdir/usr/share/ii-net/ii-txt/{ii.test.2014,.py/{echo,msg},.out}
	install -d $pkgdir/usr/bin

	install -D -m 755 ii-03/api/{sx.py,bottle.py,__init__.py,splitparser.py,flt.py} $pkgdir/usr/share/ii-net/ii-server/api/
	install -D -m 755 ii-03/echo/my.local.14 $pkgdir/usr/share/ii-net/ii-server/echo/
	install -D -m 755 ii-03/iitpl/* $pkgdir/usr/share/ii-net/ii-server/iitpl/
	install -D -m 755 ii-03/msg/oocYs0PfAD0iC3GmmNIb $pkgdir/usr/share/ii-net/ii-server/msg/
	install -D -m 755 ii-03/{LICENSE*,my.local.14.header,README.utf8,run.sh,server.cfg,*.py} $pkgdir/usr/share/ii-net/ii-server/
	install -D -m 755 ii-03/s/favicon.png $pkgdir/usr/share/ii-net/ii-server/s/
	install -D -m 755 ii-03/s/fonts/* $pkgdir/usr/share/ii-net/ii-server/s/fonts/
	install -D -m 755 ii-03/s/css/* $pkgdir/usr/share/ii-net/ii-server/s/css/
	install -D -m 755 ii-03/s/js/foundation.min.js $pkgdir/usr/share/ii-net/ii-server/s/js/
	install -D -m 755 ii-03/s/js/vendor/* $pkgdir/usr/share/ii-net/ii-server/s/js/vendor/
	install -D -m 755 ii-03/tools/gate/* $pkgdir/usr/share/ii-net/ii-server/tools/gate/
	install -D -m 755 ii-03/tools/mkhtml/* $pkgdir/usr/share/ii-net/ii-server/tools/mkhtml/
	install -D -m 755 ii-03/tools/bundle/* $pkgdir/usr/share/ii-net/ii-server/tools/bundle/
	install -D -m 755 ii-03/tools/other/traf.py $pkgdir/usr/share/ii-net/ii-server/tools/other/
	install -D -m 755 ii-03/tools/client-toss/* $pkgdir/usr/share/ii-net/ii-server/tools/client-toss/
	install -D -m 755 iiclient-03/clapi/* $pkgdir/usr/share/ii-net/ii-client/clapi/
	install -D -m 755 iiclient-03/out/1.out $pkgdir/usr/share/ii-net/ii-client/out/
	install -D -m 755 iiclient-03/{config.cfg,run.py,run.sh} $pkgdir/usr/share/ii-net/ii-client/
	install -D -m 755 iiclient-03/s/favicon.png $pkgdir/usr/share/ii-net/ii-client/s/
	install -D -m 755 iiclient-03/s/fonts/* $pkgdir/usr/share/ii-net/ii-client/s/fonts/
	install -D -m 755 iiclient-03/s/css/* $pkgdir/usr/share/ii-net/ii-client/s/css/
	install -D -m 755 iiclient-03/s/js/foundation.min.js $pkgdir/usr/share/ii-net/ii-client/s/js/
	install -D -m 755 iiclient-03/s/js/vendor/* $pkgdir/usr/share/ii-net/ii-client/s/js/vendor/
	install -D -m 755 iiclient-03/sa-node/* $pkgdir/usr/share/ii-net/ii-client/sa-node/
	install -D -m 755 iiclient-03/tpl/* $pkgdir/usr/share/ii-net/ii-client/tpl/
	
	install -D -m 755 iitxt-03/{config.cfg,*.sh,README.utf8} $pkgdir/usr/share/ii-net/ii-txt/
	install -D -m 755 iitxt-03/.py/{*.py,bbs.bbs} $pkgdir/usr/share/ii-net/ii-txt/.py/
	install -D -m 755 iitxt-03/.out/{.counter,.readme} $pkgdir/usr/share/ii-net/ii-txt/.out/
	
	install -D -m 755 iitxt-03/ii.test.2014/msg.new $pkgdir/usr/share/ii-net/ii-txt/ii.test.2014/
	install -D -m 755 scripts/* $pkgdir/usr/bin/
}
