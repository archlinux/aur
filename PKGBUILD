# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='ia-get'
pkgname="${_pkgname}-bin"
pkgver=0.1.3
pkgrel=1
pkgdesc='File downloader for archive.org'
arch=('x86_64' 'aarch64')
url='https://github.com/wimpysworld/ia-get'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("https://github.com/wimpysworld/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/wimpysworld/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f142d7daf0393cdfc0f26521d25c8f63b5d73310837e2b9174ffc5fe7f652d6a')
sha256sums_aarch64=('9bba5a9932fead55e9e295875d4f15d836e8758c08b6039f6574eabc1777c2d2')
options=("!strip")

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

