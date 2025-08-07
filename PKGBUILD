# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=timoni-bin
pkgver=0.25.0
pkgrel=1  
pkgdesc="Timoni is a package manager for Kubernetes, powered by CUE and inspired by Helm."
arch=('x86_64')
url="https://github.com/stefanprodan/timoni"
conflicts=('timoni')
provides=('timoni-bin')
license=('Apache 2')

source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0cbb2b9d8c6dd8d88157340f55007f21b7eec2fe3a47d2dd5bb4857b890999af')

package() {
  cd "${srcdir}"
  install -Dm755 "timoni" "${pkgdir}/usr/bin/timoni"
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
