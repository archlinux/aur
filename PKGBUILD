# Maintainer: Austin Keller <austin474@gmail.com>

pkgname=polynote
pkgver=0.4.2
pkgrel=1
pkgdesc="An experimental polyglot notebook environment for Scala (and more)"
arch=('any')
url="https://github.com/polynote/polynote"
license=('Apache')
depends=(
  'java-runtime'
  'python-virtualenv'
  'ipython'
  'jupyter-nbconvert'
  'python-numpy'
  'python-pandas'
  'python-jedi'
  'python-jep'
)
optdepends=('apache-spark')
source=("$pkgname-$pkgver.tgz::https://github.com/polynote/polynote/releases/download/$pkgver/polynote-dist.tar.gz")
md5sums=('84aa75e46ef75189080517a16b59c2e1')

package() {
  cd "$srcdir"

  install -d "$pkgdir"/{opt/$pkgname,usr/bin}
  mv $pkgname/* "$pkgdir"/opt/$pkgname
  chmod +x "$pkgdir"/opt/$pkgname/${pkgname}.py
  ln -s /opt/$pkgname/polynote.py "$pkgdir"/usr/bin/$pkgname
}
