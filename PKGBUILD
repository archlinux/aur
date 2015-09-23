# Maintainer: zh99998 <zh99998@gmail.com>
pkgname=openvpn-radiusplugin
pkgver=2.1a_beta1
pkgrel=3
pkgdesc="Radiusplugin for OpenVPN"
url="http://www.nongnu.org/radiusplugin/"
arch=('i686' 'x86_64')
depends=("libgcrypt")
source=("http://www.nongnu.org/radiusplugin/radiusplugin_v$pkgver.tar.gz")
sha256sums=('84f5af0927a7039d32707be21932e8989fa3bcb74c05f82bdce91a0834a16c8c')
build() {
  cd radiusplugin_v$pkgver
  make
}

package() {
  cd radiusplugin_v$pkgver
  install -Dm0644 radiusplugin.so $pkgdir/usr/lib/radiusplugin.so
  install -Dm0644 radiusplugin.cnf $pkgdir/usr/share/doc/radiusplugin/radiusplugin.cnf
}
