# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dsnitch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Real-time network and DNS egress inspector TUI for Docker containers powered by eBPF"
arch=('x86_64' 'aarch64')
url="https://github.com/infomaniac777/dsnitch"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/infomaniac777/dsnitch/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dsnitch-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dsnitch-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('f891e12d75c1d914547a88ca8914530c7c89d5088e0adac37f06da85439be987')
sha256sums_x86_64=('d61acd8ddcfb0902a0e1abfd57d348a1bac7f1b5abbdf0ac30310e0d958fbbe6')
sha256sums_aarch64=('dea309fa5130722b0cbb76668e16245eb0594d470ed4c42985cfd99efae3fe22')

package() {
  install -Dm755 "dsnitch" "${pkgdir}/usr/bin/dsnitch"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
