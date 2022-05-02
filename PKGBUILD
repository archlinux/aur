# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://github.com/lf-lang/lingua-franca"
license=('BSD')
depends=('java-runtime=17')

source=('https://github.com/lf-lang/lingua-franca/releases/download/v0.2.0/epoch_ide_0.2.0-linux.gtk.x86_64.tar.gz')
sha512sums=('c954255f159c1f271acd38a6a5a8f64b2425c5bed3a05fdf1c11d9c51be21c745b5e9127e423a39545b26b9394e1efbbc60ba7b64d93f58fea8a09a220e70378')

package() {
  mkdir -p "${pkgdir}/opt/lf"
  cp -r "${srcdir}/epoch" "${pkgdir}/opt/lf"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/opt/lf/epoch/epoch" "${pkgdir}/usr/bin/epoch"
}
