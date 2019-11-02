# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname='planck'
conflicts=('planck-git')
pkgver=2.24.0
pkgrel=1
_pkgnamever=${pkgname}-${pkgver}
pkgdesc="A stand-alone ClojureScript REPL"
arch=('x86_64')
url="http://planck-repl.org/"
depends=('webkit2gtk' 'libzip' 'zlib')
makedepends=('java-environment' 'cmake' 'clojure' 'leiningen' 'unzip' 'vim')
license=('EPL-1.0')
source=(
  https://github.com/mfikes/${pkgname}/archive/${pkgver}.tar.gz
)
sha256sums=('b4b1b36786fd55be829a6b0a42771d9134152b503dafa92ee0f2c6e57c8cb3ca')

build() {
  cd "$srcdir/${_pkgnamever}"
  script/build
}

package() {
  cd "$srcdir/${_pkgnamever}"
  install -Dm755 "$srcdir/${_pkgnamever}/planck-c/build/planck" "$pkgdir/usr/bin/planck"
}
