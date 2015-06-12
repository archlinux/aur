# Maintainer: Peter Wu <lekensteyn at gmail dot com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
pkgname=dex2jar
pkgver=2.0
pkgrel=1
pkgdesc="Tools to work with android .dex and java .class files"
arch=(any)
url="http://sourceforge.net/projects/dex2jar/"
license=('Apache')
depends=('java-runtime')
source=("http://sourceforge.net/projects/dex2jar/files/${pkgname}-${pkgver}.zip")
sha1sums=('9df351a67db5f327fb3726bb7b5c795029547301')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/dex2jar/lib/"

  install -m755 *.sh "$pkgdir/opt/dex2jar/"
  install -m644 lib/*.jar "$pkgdir/opt/dex2jar/lib/"

  ln -s /opt/dex2jar/d2j-dex2jar.sh "$pkgdir/usr/bin/dex2jar"
  # TODO: should d2j-* be installed to /usr/bin? too.
  # dex2jar.sh is gone in dex2jar-2.0, should both d2j-dex2jar and dex2jar be
  # installed, or just dex2jar?
}

# vim:set ts=2 sw=2 et:
