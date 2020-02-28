# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=v0.2.1
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
provides=("${pkgname%-bin}")
conflicts=("$pkgname" "${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/orhun/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-${pkgver#v}.tar.gz")
sha256sums=('6ba0cab6a47b11da0be909bad26289e553fb8f7ea4d663e6d4c0c7411ea6a207')

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/kmon"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
  install -Dm 644 kmon.man -t "$pkgdir/usr/local/man/man8/${pkgname%-bin}.8"
  gzip "$pkgdir/usr/local/man/man8/${pkgname%-bin}.8"
}