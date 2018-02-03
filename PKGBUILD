# Maintainer: bennya

pkgname='planck'
conflicts=('planck-git')
pkgver=2.11.0
pkgrel=1
_pkgnamever=${pkgname}-${pkgver}
pkgdesc="A stand-alone ClojureScript REPL"
arch=('x86_64')
url="http://planck-repl.org/"
depends=('webkit2gtk' 'libzip' 'zlib')
makedepends=('java-environment' 'cmake' 'leiningen' 'unzip' 'vim')
license=('EPL-1.0')
source=(
  https://github.com/mfikes/${pkgname}/archive/${pkgver}.tar.gz
)
sha256sums=('5eb997639d5303c51ab45c7b23c2db7f5a5bafffe5a5b17803521528bef7e92b')

build() {
  cd "$srcdir/${_pkgnamever}"
  script/build
}

package() {
  cd "$srcdir/${_pkgnamever}"
  install -Dm755 "$srcdir/${_pkgnamever}/planck-c/build/planck" "$pkgdir/usr/bin/planck"
}
