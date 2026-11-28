# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=eightctl-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="Fetch data from and control Eight Sleep pods"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/eightctl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/steipete/eightctl/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/eightctl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/eightctl_${pkgver}_linux_arm64.tar.gz")
sha256sums=('62316704df7426e5a79d2827ff8aca36e9abb3a73b8e68557030749ebefec667')
sha256sums_x86_64=('ac3be8ace339bf4069f8fe44d9592d4790fdc347dfe0f2d64e39e6a3f89bd54f')
sha256sums_aarch64=('9bfa2992bfce19896bd79ee777dcc108a731c326f1eba60aabe37a5baf514d87')

package() {
  install -Dm755 "./eightctl" "${pkgdir}/usr/bin/eightctl"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
