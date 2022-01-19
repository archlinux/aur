# Maintainer: Peter Wu <lekensteyn at gmail dot com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
pkgname=dex2jar
pkgver=2.1
pkgrel=1
pkgdesc="Tools to work with android .dex and java .class files"
arch=(any)
url="https://github.com/pxb1988/dex2jar"
license=('Apache')
depends=('java-runtime' 'bash')
source=("https://github.com/pxb1988/dex2jar/releases/download/v${pkgver}/dex2jar-${pkgver}.zip")
sha256sums=('7a9bdf843d43de4d1e94ec2e7b6f55825017b0c4a7ee39ff82660e2493a46f08')

package() {
  cd "$srcdir/dex-tools-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/opt/dex2jar/lib/"

  install -m755 *.sh "$pkgdir/opt/dex2jar/"
  install -m644 lib/*.jar "$pkgdir/opt/dex2jar/lib/"

  ln -s /opt/dex2jar/d2j-dex2jar.sh "$pkgdir/usr/bin/dex2jar"
}

# vim:set ts=2 sw=2 et:
