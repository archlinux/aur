# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=commit-boost-bin
_pkgname=commit-boost
pkgver=0.11.0
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
sha256sums_x86_64=('859540b87f042e28f5750fed312e18d5439f6512fbbb6cf637bed321a38e6e4e')
sha256sums_aarch64=('f7ffabad2f3125a472cc719b48f660c7a3ff0810757f6348cfa4b5846a5dac9d')

package() {
  install -Dm755 "${srcdir}/commit-boost" "${pkgdir}/usr/bin/commit-boost"
  install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
