# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname='planck'
conflicts=('planck-git')
pkgver=2.19.0
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
sha256sums=('bb33984f986a7ac68b331cfd64bd0f9e41daf5391b1a36e158e15d94d886dd04')

build() {
  cd "$srcdir/${_pkgnamever}"
  script/build
}

package() {
  cd "$srcdir/${_pkgnamever}"
  install -Dm755 "$srcdir/${_pkgnamever}/planck-c/build/planck" "$pkgdir/usr/bin/planck"
}
