# contributor Eugene Lamskoy 
# maintainer Ivan Agarkov ( ivan.agarkov@gmail.com )

pkgname=husky-tosser
_realpkg=husky
pkgver=1.9_20150211
pkgrel=1
pkgdesc="Husky Fido Tosser 1.9 (tosser and utils only, no msged)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://husky.sourceforge.net/hpt.html"
source=('huskymak.cfg'
  'areastat_makefile'
  'nltools_makefile'
  'smapi_makefile'
  'http://downloads.sourceforge.net/project/husky/husky/1.9-current/2015.02.11/husky-all-1.9-source-20150211.tgz')

prepare() {
    cp -f huskymak.cfg ${_realpkg}/
    cp -f areastat_makefile ${_realpkg}/areastat/Makefile
    cp -f nltools_makefile ${_realpkg}/nltools/Makefile
    cp -f smapi_makefile ${_realpkg}/smapi/Makefile
}

build() {
    for i in huskylib smapi fidoconf areafix hpt htick areastat bsopack nltools; do
         cd "${srcdir}/${_realpkg}/${i}"
         make
    done
}

package() {
    for i in huskylib smapi fidoconf areafix hpt htick areastat bsopack nltools; do
        cd "${srcdir}/${_realpkg}/${i}"
        make DESTDIR="$pkgdir" install
    done
}
md5sums=('189e2dbe6704b9d30dd1f133371f017e'
         '0ec212f2bb31d149cd1717ab681f519a'
         '48ba1f5f4ded114e500ef83ce1fe407a'
         'c7238eec644bd1aeaf0a0c993f5dd8fc'
         '6dc36f0c2d0a49a603a107035ba5f07a')
