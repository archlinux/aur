# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=timoni-bin
pkgver=0.15.0
pkgrel=1  
pkgdesc="Timoni is a package manager for Kubernetes, powered by CUE and inspired by Helm."
arch=('x86_64')
url="https://github.com/stefanprodan/timoni"
conflicts=('timoni')
provides=('timoni-bin')
license=('Apache 2')

source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b0b3bbd4738397a7a3b73201015778fcd7dc8fe351e2968aa8b843d11ddae09b')

package() {
  cd "${srcdir}"
  install -Dm755 "timoni" "${pkgdir}/usr/bin/timoni"
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
