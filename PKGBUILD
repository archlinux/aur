# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>

pkgname=hypopg
pkgver=1.3.1
pkgrel=1
pkgdesc="Hypothetical indexes for PostgreSQL... ask the optimizer if this hypothetical index would help"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/HypoPG/hypopg"
license=('BSD')
depends=('postgresql')
makedepends=(git)
options=(!emptydirs !libtool)
source=("git+https://github.com/HypoPG/hypopg.git#tag=${pkgver}")
md5sums=('SKIP')
install='hypopg.install'

build() {
  cd hypopg
  make
}

package() {
  cd hypopg
  make DESTDIR="$pkgdir" install
}
