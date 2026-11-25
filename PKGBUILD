# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dumbproxy-bin
pkgver=1.52.3
pkgrel=1
pkgdesc="Simple, scriptable, secure HTTP and SOCKS5 forward proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/SenseUnit/dumbproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/SenseUnit/dumbproxy/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dumbproxy.linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/dumbproxy.linux-arm64")
sha256sums=('c038c0837a6bd409247675e6bca6bbe153c8c7103c077dc25d317c4b7717f807')
sha256sums_x86_64=('deb3e0c1a6d045a0294172dba3c5b53f0d80cdd00f714e9b45335a80574a742e')
sha256sums_aarch64=('a92f95975eeb116f1646c1dcedb7c02439928400d2b4bba691b2a484ad6daf83')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dumbproxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
