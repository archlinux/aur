# Maintainer: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=gephi
pkgver=0.8.2beta
pkgrel=1
pkgdesc="An interactive graph visualization and exploration platform"
arch=('i686' 'x86_64')
url="http://gephi.org"
license=('CDDL' 'GPL3')
depends=('java-runtime' 'libxxf86vm' 'jdk7-openjdk')
makedepends=()
options=(!strip)
source=("http://launchpad.net/gephi/0.8/0.8.2beta/+download/gephi-0.8.2-beta.tar.gz")
sha256sums=('cc07dc6059f9a94dd729d8edfda230f95bc25d91dce17d94d73e5ead289bb365')

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r * "$pkgdir/opt/$pkgname"
  chmod -R 755 "$pkgdir/opt/$pkgname"
  sed -i -e 's/#jdkhome.*/jdkhome=\"\/usr\/lib\/jvm\/java-7-openjdk\"/g' $pkgdir/opt/$pkgname/etc/gephi.conf
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/gephi" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
