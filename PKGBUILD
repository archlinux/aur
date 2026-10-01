# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=commit-boost-bin
_pkgname=commit-boost
pkgver=0.10.1
pkgrel=1
pkgdesc='Commit-Boost allows Ethereum validators to safely run MEV-Boost and community-built commitment protocols. Binary distribution.'
arch=('x86_64' 'aarch64')
url='https://commit-boost.github.io/commit-boost-client/'
license=('MIT AND Apache-2.0')
depends=('libgcc' 'glibc')
options=('!debug')
provides=('commit-boost')
conflicts=('commit-boost')

_repo='https://github.com/Commit-Boost/commit-boost-client'
source=(
  "LICENSE-MIT-${pkgver}::https://raw.githubusercontent.com/Commit-Boost/commit-boost-client/v${pkgver}/LICENSE-MIT"
  "LICENSE-APACHE-${pkgver}::https://raw.githubusercontent.com/Commit-Boost/commit-boost-client/v${pkgver}/LICENSE-APACHE"
)
source_x86_64=("${_repo}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux_x86-64.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux_arm64.tar.gz")

sha256sums=('593cd24e77e6876dbd13ff289570c24ff2ade58fac631f2b5f41b072044c0f65'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('f7c32b8ea44a69565c93f0a6bb5985b4e5c27a53032e0dce89941617fe0faaa6')
sha256sums_aarch64=('dd4750d65ae245b71c930d53daeed0df14010877d4871e21fa98e256a6540ad0')

package() {
  install -Dm755 "${srcdir}/commit-boost" "${pkgdir}/usr/bin/commit-boost"
  install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
