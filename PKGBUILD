pkgname=fusiondirectory-plugin-ppolicy-schema
pkgver=1.2
pkgver=1.2
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory ppolicy plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("GPL")

depends=("fusiondirectory-schema>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('b5e96dc4deaed932868a809769ef8a71' '5447138f0e37bebd9c2dbed41b787f27')

package() {
cd ./fusiondirectory-plugins-${pkgver}
# Go in plugin directory
cd ppolicy/

    # Openldap section
    if [ -d ./contrib/openldap ] ; then
      mkdir -p ${pkgdir}/etc/openldap/schema/fusiondirectory/
      mkdir -p ${pkgdir}/usr/share/doc/fusiondirectory-plugin-ppolicy-schema/
      cp ../../fusiondirectory-${pkgver}/{AUTHORS,Changelog,COPYING} ${pkgdir}/usr/share/doc/fusiondirectory-plugin-ppolicy-schema/   
 
      # Files
      cp -a ./contrib/openldap/*.schema ${pkgdir}/etc/openldap/schema/fusiondirectory/
    fi

}
