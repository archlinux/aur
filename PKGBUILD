# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: kagan <juanynie AT gmail DOT com>

pkgname=kde-thumbnailer-blender
pkgver=0.3
pkgrel=2
pkgdesc="KDE plugin to show thumbnails of Blender files"                                                                                      
arch=('i686' 'x86_64')                                                                       
url="http://kde-look.org/content/show.php/?content=146380"                                                  
license=('GPL')                                                    
depends=('kdelibs' 'zlib')
makedepends=('cmake' 'automoc4')                                                             
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/146380-${pkgname}_${pkgver}kayosiii.tar.gz")
sha256sums=('b2162c1ea09103b87b7f6ee69725e8de972a4781fd442c34fd4b3346de878319')

package () {                                                                                   
 cd ${srcdir}/${pkgname}
 cmake -DCMAKE_INSTALL_PREFIX=/usr                                                           
 make || return 1                                                                            
 make DESTDIR=${pkgdir} install
}
