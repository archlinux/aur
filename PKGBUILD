# Maintainer: RetardedOnion@archlinux-irc 
# Creator: Mr.S of Teamspeak-Forums
pkgname=teamspeak3-massmover
pkgver=0.61.22
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. TS3MassMover by Mr. S'
arch=('x86_64')
url=""
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1')
depends=('teamspeak3>=3.1.0.1')
source=('TS3MassMover-v0.61.22.zip')
md5sums=('381bd5ee4d80df77a68d4ef9c7065e24')
package() {
	unzip -o ${srcdir}/TS3MassMover-v0.61.22.zip 
	c++ -shared -I /usr/include/teamspeak3 -shared -I /usr/include/qt   -fPIC -o ${pkgdir}/TS3MassMover.so ${srcdir}/source/plugin.cpp
	mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
	install -D -m644 ${pkgdir}/TS3MassMover.so "$pkgdir/opt/teamspeak3/plugins/TS3MassMover.so"
}
