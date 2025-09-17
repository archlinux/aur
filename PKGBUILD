# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='ia-get'
pkgname="${_pkgname}-bin"
pkgver=0.1.2
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
sha256sums_x86_64=('ea01bd16c1b760ae33ccac3f4c045b9c7791b6bd7bf9aea431dd200c28f8f38d')
sha256sums_aarch64=('ed913f6aec7b8b67f949b00d8ed2dfdd32e3e3e4b8c6e5666df7dbac4775ea6c')
options=("!strip")

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

