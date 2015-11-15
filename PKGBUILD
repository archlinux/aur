# Maintainer: Stephen Smith <stephen304@gmail.com>
pkgname=armsimsharp
pkgver=1.0
pkgrel=1
pkgdesc="The ARMSim# program."
arch=(any)
url="http://armsim.cs.uvic.ca/index.html"
depends=(mono)
source=("http://armsim.cs.uvic.ca/Downloads/ARMSim-191-MAC.zip" "ARMSim.exe.config.patch" "armsimsharp")
md5sums=('ea523500526e19c73965b4fb8108163f'
         '9d411f7f252516fa289756efe6eed5cd'
         '815e1e557b89f634b136a252c6fc61db')
# install=$pkgname.install

prepare() {
  patch -d "${srcdir}" < ARMSim.exe.config.patch
}

package() {
  install -d "$pkgdir/opt/armsimsharp"
  install -Dm644 "$srcdir/"* "$pkgdir/opt/armsimsharp/"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
