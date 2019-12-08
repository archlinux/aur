# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=multivalent-pdf-tools
_arcname=Multivalent
pkgver=20060102
pkgrel=2
pkgdesc="PDF tools to compress, impose, decrypt/encrypt, split/merge from Multivalent"
arch=(any)
url="http://sourceforge.net/projects/multivalent"
license=('GPL')
depends=("java-environment")
# XXX: This version is no longer available from the upstream source, but newer
# versions do not ship the PDF tools
#source=(https://scm.narf.ssji.net/svn/archlinux-packages/export/350/multivalent-pdf-tools/Multivalent20060102.jar)
# XXX: My trac is currently broken
source=("https://scm.narf.ssji.net/$_arcname$pkgver.jar"
        'run-multivalent')
md5sums=('813bb651a1cc6ea230f28aac47f78051'
         '588ea28547cfc070bc59cbbc0abd5569')

package() {
  install -D -m 644 "$srcdir/$_arcname$pkgver.jar" "$pkgdir/usr/share/java/multivalent/$_arcname.jar"
  install -D -m 755 "$srcdir/run-multivalent" "$pkgdir/usr/bin/multivalent"
}
