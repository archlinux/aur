# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Marcin Nowak <marcin.j.nowak+aur # gmail DOT com>
# Contributor: Koi Dong <akillcool#live.com>
# Contributor: Sergei Marochkin <me@ziggi.org>
# Contributor: Morris Jobke <morris.jobke AT gmail DOT com>
# Contributor: Boris Shomodjvarac <shomodj AT gmail DOT com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
pkgname=dbschema
pkgver=9.4.0
pkgrel=1
pkgdesc='Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.'
arch=('i686' 'x86_64')
url='http://www.dbschema.com/'
license=('custom')
depends=(java-runtime java-openjfx)
source=("${pkgname}-${pkgver}.tar.gz::https://www.dbschema.com/download/DbSchema_unix_${pkgver//./_}.tar.gz"
        "dbschema.desktop")
md5sums=('c695a9844f077d45877057e919f58828'
         '6ee4511b39884a2e6fdd63fd6bbdea8e')
sha512sums=('fe5e78daf6706e2578efb5d5115b87306f3a5075b8cc9960f85a3476302b963e506ea119502bab86f585b0b1b12aee2ef6a5b824abe64db3f068ac2d0a332cde'
            '1f82da894596bc44d77a179e56750e86628ed522cee68755ef348d4ba7cd53776783acf87592a1fa238eee09eb377a52406c04bd56e88701decb0c8ca985bbb3')

package(){
  install -dm755 ${pkgdir}/opt
  cp -r DbSchema ${pkgdir}/opt/${pkgname}

  chmod 755 ${pkgdir}/opt/${pkgname}/DbSchema

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/DbSchema" "${pkgdir}/usr/bin/dbschema"
}
