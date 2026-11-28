# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rss-funnel-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Self-hosted RSS multi-tool"
arch=('x86_64' 'aarch64')
url="https://github.com/shouya/rss-funnel"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/rss-funnel-${pkgver}-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/rss-funnel-${pkgver}-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('1a64752716b144cc10d2cc589dec4d04ad0f5280b9d1867c0fa27d465f098898')
sha256sums_aarch64=('c29eae534e2acf6a422f19a5d1b53ba35330071ae92420f4052b03a428364586')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rss-funnel-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="rss-funnel-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/rss-funnel" "${pkgdir}/usr/bin/rss-funnel"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
