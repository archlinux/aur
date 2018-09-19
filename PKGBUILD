# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname='planck'
conflicts=('planck-git')
pkgver=2.17.0
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
sha256sums=('c7907add05bc552fc2c298c27b53978ecd1f656c89bdfbe3c7569b9afc7e6377')

build() {
  cd "$srcdir/${_pkgnamever}"
  script/build
}

package() {
  cd "$srcdir/${_pkgnamever}"
  install -Dm755 "$srcdir/${_pkgnamever}/planck-c/build/planck" "$pkgdir/usr/bin/planck"
}
