# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=polynote
pkgver=0.3.12
pkgrel=1
pkgdesc="An experimental polyglot notebook environment for Scala (and more)"
arch=('any')
url="https://github.com/polynote/polynote"
license=('Apache')
depends=('java-runtime' 'python-jep')
source=("$pkgname-$pkgver.tgz::https://github.com/polynote/polynote/releases/download/$pkgver/polynote-dist.tar.gz")
md5sums=('1ea21c6972461c1cb3a8fd37e0bb56f8')

package() {
  cd "$srcdir"

  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv $pkgname/* "$pkgdir"/opt/$pkgname
  chmod +x "$pkgdir"/opt/$pkgname/${pkgname}.py
  chmod +x "$pkgdir"/opt/$pkgname/${pkgname}.jar
  ln -s /opt/$pkgname/polynote.py "$pkgdir"/usr/bin/$pkgname
}
