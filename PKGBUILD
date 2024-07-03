# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=timoni-bin
pkgver=0.22.0
pkgrel=1  
pkgdesc="Timoni is a package manager for Kubernetes, powered by CUE and inspired by Helm."
arch=('x86_64')
url="https://github.com/stefanprodan/timoni"
conflicts=('timoni')
provides=('timoni-bin')
license=('Apache 2')

source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5113199c99b7afa555f990488252bf29d0c751a8cf82450e6ab918e1648b1f40')

package() {
  cd "${srcdir}"
  install -Dm755 "timoni" "${pkgdir}/usr/bin/timoni"
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
