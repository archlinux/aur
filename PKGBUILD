# Maintainer: Mateusz Janczuk <devqore@gmail.com>
pkgname=myrdp
pkgver=2018.1.1
pkgrel=1
pkgdesc="RDP client using freerdp. Similar to Remmina, mRemoteNG, RDCMan."
arch=('any')
url="https://github.com/devqore/myrdp"
license=('GPL')
depends=('freerdp' 'python2' 'python2-alembic' 'python2-pyqt4'
         'python2-pycryptodomex')
makedepends=('git')
source=("myrdp.sh"
        "myrdp.desktop"
        "$pkgname::git://github.com/szatanszmatan/myrdp#tag=$pkgver")
sha256sums=('7ca211c23f2600d4406058f32cc22b8a42f0c9874b366496e3d0bda0c05ea4b5'
            '3fae3a047a78501872577f21b65026f69ba5e918d47565c60362cef223f66876'
            'SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R "$srcdir/$pkgname/app/" "$pkgdir/usr/share/$pkgname"
  install -Dm755 "$srcdir/myrdp.sh" "$pkgdir/usr/bin/myrdp"
  install -Dm644 "$srcdir/myrdp.desktop" "$pkgdir/usr/share/applications/myrdp.desktop"
  for f in "main.py" "LICENSE"; do
    install -Dm644 "$srcdir/$pkgname/$f" "$pkgdir/usr/share/$pkgname/$f"
  done
}
