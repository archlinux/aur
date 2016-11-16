# Contributor: Artur Gurov <artgur90@gmail.com>
pkgname=tasksh
pkgver=1.1.0
pkgrel=3
pkgdesc='A shell command that wraps Taskwarrior commands'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tasktools.org/projects/tasksh.html"
license=('MIT')
depends=('task')
makedepends=('cmake')
source=('http://taskwarrior.org/download/tasksh-latest.tar.gz')
sha512sums=('ba8820c26a86085f996cf884c57e8fd7913cded40ea81d3f17242295e865ed1058b2c0af78d76b2f64aebf96c981665fb2482808d41312e5ff40ecb1eba7bf8a')
build() {
 cd "${pkgname}-${pkgver}"
 cmake . -DCMAKE_INSTALL_PREFIX=/usr
 make
}
package() {
 cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

