pkgname=rastertokpsl-fs-1040
pkgver=1.0
pkgrel=1
pkgdesc="Kyocera_FS-1040 Linux driver"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/lurepheonix/rastertokpsl-fs-1040"
license=('custom')
depends=('cups')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=('git+https://github.com/lurepheonix/rastertokpsl-fs-1040.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/share/cups/model
  mkdir -p $pkgdir/usr/share/cups/model/Kyocera
  install -Dm644 Kyocera_FS-1040GDI.ppd $pkgdir/usr/share/cups/model/Kyocera/Kyocera_FS-1040GDI.ppd
  install -Dm755 rastertokpsl $pkgdir/usr/lib/cups/filter/rastertokpsl
  install -Dm755 rastertokpsl-fixed $pkgdir/usr/lib/cups/filter/rastertokpsl-fixed
}
