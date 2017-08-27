# Maintainer: Santiago Pelufo <santiagopelufo@gmail.com>

pkgname=clojure-install
pkgver=1.8.0
pkgrel=1
pkgdesc='The Clojure Programming Language'
url='http://clojure.org/'
arch=('any')
license=('CPL')
depends=('java-environment' 'bash')
makedepends=('java-environment' 'sed')
optdepends=('rlwrap: friendlier shell with readline support')
conflicts=('clojure')
source=("https://download.clojure.org/install/brew/install-clj-1.8.0.119.tar.gz")
sha256sums=('7e272d3ae13d97c8fb6848d6851112e88995958391f40a1787bd82b6222d779e')

package() {
  sed -i s:PREFIX:/usr/share/clojure:g install-clj
  install -Dm755 clj "$pkgdir/usr/bin/clj"
  install -Dm755 install-clj "$pkgdir/usr/bin/install-clj"
  install -Dm644 install-clj-1.8.0.119.jar "$pkgdir/usr/share/clojure/install-clj-1.8.0.119.jar"
  install -Dm644 clj.props "$pkgdir/usr/share/clojure/clj.props"
}
