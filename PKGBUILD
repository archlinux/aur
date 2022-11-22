# Maintainer: coxackie
pkgname=julia-workarounds
pkgver=2022.11.22
pkgrel=1
pkgdesc='Workarounds to make Julia built against system libraries work better'
arch=('x86_64')
depends=('julia' 'openblas')
source=('cert.pem')

package() {
  install -dm755 "$pkgdir/usr/share/julia/"
  install -dm755 "$pkgdir/usr/lib/"
  install -Dm 644 "${srcdir}/cert.pem" "${pkgdir}/usr/share/julia/cert.pem"
  cd "$pkgdir/usr/lib/"
  ln -s libopenblas.so libopenblas64_.so
}

sha256sums=('bb28d145ed1a4ee67253d8ddb11268069c9dafe3db25a9eee654974c4e43eee5')
