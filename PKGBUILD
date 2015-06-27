# Maintainer: Maverick <basic89@gmail.com>
pkgname=pcng-tubs
pkgver=14.0
pkgrel=1
pkgdesc="TU Braunschweig printing client (Papercut NG, preconfigured)"
arch=(any)
url="https://doku.rz.tu-bs.de/doku.php?id=drucken:installation_druck-client_linux_eb_mb"
license=('custom')
groups=()
depends=('java-environment'
  'sh')
makedepends=('unzip')
optdepends=('cups: printing support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://gitz-dl.tu-bs.de/software/pcng/GITZ_drucken_linux.zip'
  'pcng-tubs.desktop'
  'pcng-tubs.png'
  'pcng-tubs')
noextract=('GITZ_drucken_linux.zip')
md5sums=('5ce4d1baf9499531e3eb0cec9d61c94d'
         '9a1945d32cede42e3464dabce8796c75'
         'd7d02bbc52bf60dd8456a8d7354160c0'
         '5adbdafb5cb2dbf5b903a42ec508bd2c')

build() {
  cd "$srcdir"
  unzip -o GITZ_drucken_linux.zip
}

package() {
  mkdir -p "$pkgdir/opt/pcng"
  cp -Rp linux/* "$pkgdir/opt/pcng/"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
