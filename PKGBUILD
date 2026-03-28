# Maintainer: Shira Nguyen <sn3446409@gmail.com>

_pkgname=xmodits-cli
pkgname=xmodits-cli-bin
_srcver="v0.11.5"
pkgver="${_srcver#v}"
pkgrel=1
pkgdesc="A tool to bulk extract samples from various tracker modules with ease. CLI version"
arch=('x86_64' 'aarch64')
url="https://github.com/B0ney/xmodits-cli/"
license=('LGPL-3.0-only')
depends=(
  glibc
  libgcc
)
options=(!strip)
provides=('xmodits' 'xmodits-cli')
conflicts=('xmodits-cli')
source=("xmodits-license::https://raw.githubusercontent.com/B0ney/xmodits-cli/refs/heads/main/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}releases/download/${_srcver}/xmodits-cli-linux-x86_64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}releases/download/${_srcver}/xmodits-gli-linux-aarch64-gnu.tar.gz")
sha256sums=(SKIP)
sha256sums_x86_64=('dfc65460bd37ea12bc579859078be2eabf186df8e23da5641c9264f7bc4029dd')
sha256sums_aarch64=('c0ada9e13750008558ff54df0099399d870bf307270ee3684c4776b0d484d004')

package() {
    install -Dm755 "${srcdir}/xmodits" "${pkgdir}/usr/bin/xmodits"
    install -Dm644 "${srcdir}/xmodits-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}




