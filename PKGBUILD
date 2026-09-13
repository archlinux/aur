pkgname=dosierskanilo-gui
pkgver=0.6.0
pkgrel=1
pkgdesc='GTK desktop frontend for DosierSkanilo JSON data'
arch=('x86_64')
url='https://gitlab.vahanus.net/dlang/dosierskanilo-gui'
license=('custom:CC-BY-NC-SA-4.0')
depends=('gtk3' 'gstreamer' 'dosierskanilo')
makedepends=('ldc' 'dub' 'git')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.vahanus.net/dlang/dosierskanilo-gui/-/archive/v$pkgver/dosierskanilo-gui-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/dosierskanilo-gui-v$pkgver"
  DC=ldc2 dub build --build=release --compiler=ldc2
}

package() {
  cd "$srcdir/dosierskanilo-gui-v$pkgver"
  install -Dm755 build/bin/dosierskanilo-gui "$pkgdir/usr/bin/dosierskanilo-gui"
}
