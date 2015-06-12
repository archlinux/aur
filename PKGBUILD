pkgname=gimp-plugin-id-photo
pkgver=20120611beta
pkgrel=1
pkgdesc="id photo for documents gimp plugin"
arch=(i686 x86_64)
url="http://gimp-id-photo.ru/"
license=('GPL3')
depends=('python2' 'gimp')
source=(http://gimp-id-photo.ru/files/id_photo_BETA_for_GIMP-2.8.x_11_June_2012.zip)
md5sums=('199971d207e8c9af503d22a6f411d531')

build() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' id_photo_BETA.py
}

package() {
  cd "$srcdir"
  install -Dm0755 id_photo_BETA.py $pkgdir/usr/lib/gimp/2.0/plug-ins/id_photo_BETA.py
#  install -Dm0644 formats.conf $pkgdir/usr/lib/gimp/2.0/plug-ins/formats.conf
}
