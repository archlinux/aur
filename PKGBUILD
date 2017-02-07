# Maintainer: Sergei Marochkin <me@ziggi.org>
# Contributor: Morris Jobke <morris.jobke AT gmail DOT com>
# Contributor: Boris Shomodjvarac <shomodj AT gmail DOT com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
pkgname=dbschema
pkgver=7.4.12
pkgrel=1
pkgdesc='Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.'
arch=('i686' 'x86_64')
url='http://www.dbschema.com/'
license=('custom')
depends=('java-runtime')
install="dbschema.install"
source=("http://www.dbschema.com/download/DbSchema_unix_${pkgver//./_}.tar.gz"
        "dbschema"
        "dbschema.desktop"
        "dbschema.install")
sha512sums=('SKIP'
            'b0268f7aed11e3b1e54644d5e93938922f497c079b37dc18a5c965444ab3a52e9a170a747a139555a1e802d2ebea45ef07e295699e4cbccce8a6a2246f35ee65'
            'b0f62b502a758fdfb550cc1dc91237b37b0e5b0ceadbad9c76dd67cba20756e786573f2c99fe185bea115f5d97f8beaac42b834e1b0be6f0bdaafff711987b09'
            'bd69df33d839cf87430da26e97b6bd2a8f9f1bbf7f29f474e8ba540c9ceb2bbea19e684a8d6c4e9b4db32ed1e0e5762a8b28419e3079aa4e4d55ae3d04c1ba14')

package(){
  install -dm755 ${pkgdir}/opt
  cp -r DbSchema ${pkgdir}/opt/${pkgname}

  chmod 755 ${pkgdir}/opt/${pkgname}/DbSchema

  install -Dm755 dbschema ${pkgdir}/usr/bin/dbschema
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
