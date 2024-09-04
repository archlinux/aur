# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='A modern watch command, binary version'
url="https://github.com/sachaos/viddy"
_urlraw="https://raw.githubusercontent.com/sachaos/viddy/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=('viddy')
provides=('viddy')
source=("${_urlraw}/LICENSE" "${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-i686.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e6eea22d4e9e0aa6a78d0f9126009ec041ea047f94b320c003c34a631821f953'
            '0af90d708d0743dbd58ec07db904a0a526be55c104c33ee4211cd2eb99ff8b19')
sha256sums_x86_64=('66d3af06b1e4b5169cd16c0436f49bb9cf36269dc911fc0f1dda748138556f87')
sha256sums_i686=('4090ebd32c321ea0c474447268e10e9948e8c11d8044f4b38865c61d840b6c2a')
sha256sums_aarch64=('13a055bdcece77ad355e43648c378d0d811b6257ca6091a9a569f98849d98a70')

package() {
  cd "$srcdir/"

  install -Dm755 viddy "${pkgdir}/usr/bin/viddy"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
