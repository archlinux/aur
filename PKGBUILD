# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Tony Crisci <tony@dubstepdish.com>

pkgname=i3-style
pkgver=1.0.2
pkgrel=1
pkgdesc="Make your i3 config a little more stylish"
arch=('any')
url="https://github.com/acrisci/i3-style"
license=('BSD-2-Clause')
makedepends=('cargo')
source=("https://github.com/altdesktop/i3-style/archive/v${pkgver}.tar.gz")
md5sums=('f1cec0d8d31416e5bbaf2a2b7afbd308')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/themes"/* -t "$pkgdir/usr/share/${pkgname}/themes/"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${pkgname}-${pkgver}/target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
# vim:set ts=2 sw=2 et: