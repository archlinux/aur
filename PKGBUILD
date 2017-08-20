# Maintainer: bennya

pkgname='planck'
conflicts=('planck-git')
pkgver=2.7.3
pkgrel=2
_pkgnamever=${pkgname}-${pkgver}
pkgdesc="A stand-alone ClojureScript REPL"
arch=('x86_64')
url="http://planck-repl.org/"
depends=('webkit2gtk' 'libzip' 'zlib')
makedepends=('java-environment' 'cmake' 'leiningen' 'unzip')
license=('EPL-1.0')
source=(
  https://github.com/mfikes/${pkgname}/archive/${pkgver}.tar.gz
)
sha256sums=('16a620c33bc15c2f74ce1e80726c55c85f634443c9675c0c08292a964eb01780')

build() {
  cd "$srcdir/${_pkgnamever}"
  script/build
}

package() {
  cd "$srcdir/${_pkgnamever}"
  install -Dm755 "$srcdir/${_pkgnamever}/planck-c/build/planck" "$pkgdir/usr/bin/planck"
}
