# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=polynote
pkgver=0.3.6
pkgrel=1
pkgdesc="An experimental polyglot notebook environment for Scala (and more)"
arch=('any')
url="https://github.com/polynote/polynote"
license=('Apache')
depends=('java-runtime' 'python-jep')
source=("$pkgname-$pkgver.tgz::https://github.com/polynote/polynote/releases/download/$pkgver/polynote-dist.tar.gz")
md5sums=('40b916aa084038d952a78c16575c82c3')

package() {
  cd "$srcdir"

  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv $pkgname/* "$pkgdir"/opt/$pkgname
  chmod +x "$pkgdir"/opt/$pkgname/${pkgname}.py
  chmod +x "$pkgdir"/opt/$pkgname/${pkgname}.jar
  ln -s /opt/$pkgname/polynote.py "$pkgdir"/usr/bin/$pkgname
}
