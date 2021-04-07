pkgname=gimp-plugin-id-photo
pkgver=20180606
pkgrel=1
pkgdesc="id photo for documents gimp plugin"
arch=(i686 x86_64)
url="http://gimp-id-photo.ru/"
license=('GPL3')
depends=('python2' 'gimp' 'python2-gimp')
source=(http://gimp-id-photo.ru/files/id_photo_for_GIMP-2.10.x.zip)
sha256sums=('2572260925f8fa4353dee1d7c460cc15d4529d5f5a5713ef4b2560d59e710fb3')

prepare() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' id_photo_BETA.py
}

package() {
  cd "$srcdir"
  install -Dm0755 id_photo_BETA.py $pkgdir/usr/lib/gimp/2.0/plug-ins/id_photo_BETA.py
}
