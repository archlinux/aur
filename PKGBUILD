# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=0.4.1
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('bd8e37fcdea9bc11190a9c1236abefee6c34b979ab5cbf92cb32b1046d2143a3')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
