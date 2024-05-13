# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Marcin Nowak <marcin.j.nowak+aur # gmail DOT com>
# Contributor: Koi Dong <akillcool#live.com>
# Contributor: Sergei Marochkin <me@ziggi.org>
# Contributor: Morris Jobke <morris.jobke AT gmail DOT com>
# Contributor: Boris Shomodjvarac <shomodj AT gmail DOT com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
pkgname=dbschema
pkgver=9.5.4
pkgrel=1
pkgdesc='Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.'
arch=('i686' 'x86_64')
url='http://www.dbschema.com/'
license=('custom')
depends=(java-runtime java-openjfx)
source=("${pkgname}-${pkgver}.tar.gz::https://www.dbschema.com/download/DbSchema_unix_${pkgver//./_}.tar.gz"
	"dbschema.desktop")
# verify here: https://dbschema.com/download/md5sums
md5sums=('dac7a57db10d66c4a39daff4d923795a'
         '6ee4511b39884a2e6fdd63fd6bbdea8e')
sha512sums=('3a5a4f291c91a38382d3716e362954004df78f6bcfa6e7ef1cc7e01b28db185cbd5d1e6c851438a12c2e33bf082bec152208a45593d9da91d0ca951ad16c17f2'
            '1f82da894596bc44d77a179e56750e86628ed522cee68755ef348d4ba7cd53776783acf87592a1fa238eee09eb377a52406c04bd56e88701decb0c8ca985bbb3')

package() {
	install -dm755 "${pkgdir}/opt"
	cp -r DbSchema "${pkgdir}/opt/${pkgname}"

	chmod 755 "${pkgdir}/opt/${pkgname}/DbSchema"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/DbSchema" "${pkgdir}/usr/bin/dbschema"
}
