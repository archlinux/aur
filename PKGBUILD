# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=qconnect
pkgver=1.8.1
pkgrel=3
pkgdesc="Allows the running of reconnectable programs via torque with tmux, xpra, and tigervnc"
arch=('any')
license=('MIT')
depends=('python' 'torque' 'tmux')
optdepends=('xpra-winswitch: GUI applications'
            'tigervnc: VNC connections')
url="https://github.com/MikeDacre/qconnect"
source=("https://github.com/MikeDacre/qconnect/raw/master/packages/${pkgname}_${pkgver}.tar.gz"{,.asc})

md5sums=('44e6f06e30fc64e25ba9974ed3a4ec73'
         'SKIP')

validpgpkeys=('E955C0840FDEE708278188E9ADA7B25FE76370D6')

package() {
  install -dm0755 "$pkgdir/usr/bin"
  install -dm0755 "$pkgdir/usr/share/qconnect"
  install -dm0755 "$pkgdir/usr/share/man/man1"
  install -dm0755 "$pkgdir/usr/share/licenses/qconnect"
  install -m0555 "$srcdir/${pkgname}_${pkgver}/qconnect.py" "$pkgdir/usr/bin"
  install -m0444 "$srcdir/${pkgname}_${pkgver}/README.md" "$pkgdir/usr/share/qconnect"
  install -m0444 "$srcdir/${pkgname}_${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/qconnect"
  install -m0444 "$srcdir/${pkgname}_${pkgver}/qconnect.1.gz" "$pkgdir/usr/share/man/man1/"
  cd "$pkgdir/usr/bin"
  ln -s qconnect.py qconnect
}
