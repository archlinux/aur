pkgname=gimp-plugin-id-photo
pkgver=20250817
pkgrel=1
pkgdesc="id photo for documents gimp plugin"
arch=(any)
url="https://gimp-id-photo.ru/instruction_manual.html"
license=('GPL3')
depends=('python' 'gimp')
source=("source.tar.gz::https://github.com/karabanov/gimp-id-photo/archive/refs/heads/copilot/fix-86d4b524-8ebf-4fbb-bd3c-e6877223c59d.tar.gz")
sha256sums=(c1569adb475ef21ec79c66bc81f890b879b4d6a34d46e9cc43051a1eaf3bd745)
noextract=(source.tar.gz)

prepare() {
  mkdir -p "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
  tar -xf ../source.tar.gz --strip-components=1
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 gimp-id-photo.py $pkgdir/usr/lib/gimp/2.0/plug-ins/gimp-id-photo.py
  install -Dm0755 gimp-id-photo.py $pkgdir/usr/lib/gimp/3.0/plug-ins/gimp-id-photo/gimp-id-photo.py
}
