# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=megacubo
pkgver=16.1.9
pkgrel=3
pkgdesc="An intuitive, free and open source IPTV player."
url="https://github.com/efoxbr/megacubo"
license=('GPL-3')
depends=('libxss' 'libxtst' 'libappindicator-gtk2' 'gconf-gtk2' 'libnotify')
provides=("${pkgname}")
arch=('x86_64' 'i686')
source_x86_64=("https://github.com/efoxbr/megacubo/releases/download/v${pkgver}/Megacubo_${pkgver}_linux_x64.tar.gz"
"${pkgname}.desktop"
 )
 source_i686=("https://github.com/efoxbr/megacubo/releases/download/v${pkgver}/Megacubo_${pkgver}_linux_ia32.tar.gz"
 "${pkgname}.desktop"
 )

package() {
	
	mkdir -p ${pkgdir}/opt/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/icons/
	tar -xf ${srcdir}/Megacubo_${pkgver}_linux_*.tar.gz -C ${pkgdir}/opt/$pkgname
	mv -uf $pkgname.desktop ${pkgdir}/usr/share/applications/
	chmod 755 ${pkgdir}/usr/share/applications/$pkgname.desktop
	cp ${pkgdir}/opt/megacubo/package.nw/default_icon.png ${pkgdir}/usr/share/icons/megacubo.png
	
}
sha512sums_x86_64=('fc478c2a17b78e200650d0051ab561c8dbfc65cc028f5e58ba691f161eeb1d53c3af60fdbf567c8278f41b80e870c6dd0cad41a16670642521b30d45b68b7c91'
                   '7aeefaf7a065052366caef614b8fc14d1d8d6070317e8637a07e8adc1b86b4f733a4609046f7d4ea8540e9bcbae99953e5521d7ccb4fdbd9a95199e5120609e2')
sha512sums_i686=('f02199eb0233fd4937d2d19b846aab42b1528b986e0ed5e7e434916882e81e5ca41837ed3e677b952adfaf4cb4be9f9f1d67642905b363bba91de1ead538d61f'
                 '7aeefaf7a065052366caef614b8fc14d1d8d6070317e8637a07e8adc1b86b4f733a4609046f7d4ea8540e9bcbae99953e5521d7ccb4fdbd9a95199e5120609e2')

