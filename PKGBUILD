# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=channelterm-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Shared terminal sessions for humans and AI agents, starting with serial debugging"
arch=('x86_64' 'aarch64')
url="https://github.com/akira-init1/ChannelTerm"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/akira-init1/ChannelTerm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/channelterm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/channelterm_${pkgver}_linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('023b9e71fca030c6a80d2f60adb18e086e91d71f9b2b11da0aca11eeb7e92572')
sha256sums_aarch64=('2b65f906abfd6116952cbf93fc7e5a846241afa21b268daeebbeceb70d4a98f3')

package() {
  install -Dm755 "channelterm" "${pkgdir}/usr/bin/channelterm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
