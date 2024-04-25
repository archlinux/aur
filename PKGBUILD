# Maintainer: Jack Yu <jackyu1996 at gmail dot com>
# Contributor: Peter Wu <lekensteyn at gmail dot com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
pkgname=dex2jar
pkgver=2.4
pkgrel=1
pkgdesc="Tools to work with android .dex and java .class files"
arch=(any)
url="https://github.com/pxb1988/dex2jar"
license=('Apache')
depends=('java-runtime' 'bash')
source=("https://github.com/pxb1988/dex2jar/releases/download/v${pkgver}/dex-tools-v${pkgver}.zip")
sha256sums=('ee7c45eb3c1d2474a6145d8d447e651a736a22d9664b6d3d3be5a5a817dda23a')

package() {
  cd "$srcdir/dex-tools-v$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/dex2jar/lib/"

  install -m755 *.sh "$pkgdir/opt/dex2jar/"
  install -m644 lib/*.jar "$pkgdir/opt/dex2jar/lib/"

  ln -s /opt/dex2jar/d2j-dex2jar.sh "$pkgdir/usr/bin/dex2jar"
}

# vim:set ts=2 sw=2 et:
