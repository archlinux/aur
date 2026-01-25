# Maintainer: Jack Yu <jackyu1996 at gmail dot com>
# Contributor: Peter Wu <lekensteyn at gmail dot com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
pkgname=dex2jar
pkgver=2.4.34
pkgrel=1
pkgdesc="Tools to work with android .dex and java .class files. ThexXTURBOXx's fork."
arch=(any)
url="https://github.com/thexxturboxx/dex2jar"
license=('Apache')
depends=('java-runtime' 'bash')
source=("https://github.com/thexxturboxx/dex2jar/releases/download/${pkgver}/dex-tools-${pkgver}.zip")
sha256sums=('3fb22ebc0e456a3a30267cb9bcf22aaea5b6a618ac5e446e6842f950e72f3963')

package() {
  cd "$srcdir/dex-tools-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/dex2jar/lib/"

  install -m755 *.sh "$pkgdir/opt/dex2jar/"
  install -m644 lib/*.jar "$pkgdir/opt/dex2jar/lib/"

  ln -s /opt/dex2jar/d2j-dex2jar.sh "$pkgdir/usr/bin/dex2jar"
}

# vim:set ts=2 sw=2 et:
