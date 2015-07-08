# Maintainer: Mattias Andrée <email:decode64(bWF0dGlhcy5hbmRyZWVAZ21haWwuY29tCg==)>
pkgname=ponysay-free
pkgver=3.0.2
pkgrel=1
pkgdesc="Awesome cowsay reimplemention with ponies for ponies. Only free ponies edition"
arch=('any')
url="https://github.com/erkin/ponysay"
license=('GPL3' 'FDL')
depends=('python' 'coreutils')
optdepends=('util-say: ')
makedepends=('texinfo')
conflicts=('ponysay')
source=(https://github.com/erkin/ponysay/archive/${pkgver}.tar.gz)
sha256sums=(69e98a7966353de2f232cbdaccd8ef7dbc5d0bcede9bf7280a676793e8625b0d)

build() {
  cd "$srcdir/ponysay-${pkgver}"
  ./setup.py --prefix=/usr --dest-dir="$pkgdir" --freedom=strict build
}

package() {
  cd "$srcdir/ponysay-${pkgver}"
  ./setup.py --prefix=/usr --dest-dir="$pkgdir" --freedom=strict prebuilt
}

