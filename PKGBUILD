# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=hush-lightwalletd
_name='lightwalletd'
pkgver=0.1.2
pkgrel=1
pkgdesc='HUSH Lightwallet daemon for running SDL servers'
url='https://git.hush.is/hush/lightwalletd'
arch=('x86_64')
license=('GPL3')
makedepends=('go')
provides=('lightwalletd')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$_name"
  make build
}

package() {
  install -Dm755 "${srcdir}/$_name/lightwalletd" "${pkgdir}/opt/$pkgname/lightwalletd"
  install -Dm644 "${srcdir}/$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$_name/doc/man/lightwalletd.1" "${pkgdir}/usr/share/man/man1/lightwalletd.1"

  # links to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/lightwalletd "${pkgdir}/usr/bin"
}
