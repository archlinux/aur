# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=0.6.0
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('47065ed36939d24c6c604dce4110b8bceb29405db85282c70b826d11dddd6eb2')

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
