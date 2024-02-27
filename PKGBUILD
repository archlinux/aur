# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Marcin Nowak <marcin.j.nowak+aur # gmail DOT com>
# Contributor: Koi Dong <akillcool#live.com>
# Contributor: Sergei Marochkin <me@ziggi.org>
# Contributor: Morris Jobke <morris.jobke AT gmail DOT com>
# Contributor: Boris Shomodjvarac <shomodj AT gmail DOT com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
pkgname=dbschema
pkgver=9.5.2
pkgrel=1
pkgdesc='Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.'
arch=('i686' 'x86_64')
url='http://www.dbschema.com/'
license=('custom')
depends=(java-runtime java-openjfx)
source=("${pkgname}-${pkgver}.tar.gz::https://www.dbschema.com/download/DbSchema_unix_${pkgver//./_}.tar.gz"
        "dbschema.desktop")
md5sums=('feecdfb7c0df6bef4d2fc814454adadb'
         '6ee4511b39884a2e6fdd63fd6bbdea8e')
sha512sums=('cedd5dbc53c4ef8f905d2cfdd7f2e24479b43ec106ac881ff0e2fc7f79287daba68365da60b29bc69695b5095b73c33099f01de6d1e2c1261875afec8a6ce27e'
            '1f82da894596bc44d77a179e56750e86628ed522cee68755ef348d4ba7cd53776783acf87592a1fa238eee09eb377a52406c04bd56e88701decb0c8ca985bbb3')

package(){
  install -dm755 ${pkgdir}/opt
  cp -r DbSchema ${pkgdir}/opt/${pkgname}

  chmod 755 ${pkgdir}/opt/${pkgname}/DbSchema

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/DbSchema" "${pkgdir}/usr/bin/dbschema"
}
