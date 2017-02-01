pkgname=fusiondirectory-plugin-ppolicy-schema
pkgver=1.0.19
pkgver=1.0.19
pkgrel=1
pkgdesc="LDAP schema for FusionDirectory ppolicy plugin"
arch=("any")
url="http://fusiondirectory.org/"
license=("LGPL")

depends=("fusiondirectory-schema>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-plugins-${pkgver}.tar.gz"
"http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('409aebff6a90aef73cce834485501305' 'a8502cf3ba20477f80de10a59c462c14')

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
