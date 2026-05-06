# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_pkgname='ia-get'
pkgname="${_pkgname}-bin"
pkgver=0.1.4
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
sha256sums_x86_64=('96bc1c5b8e7dfae9e6fb6362f2c80884b90d837e1486c835cfac8c98ffd57186')
sha256sums_aarch64=('31e6bdb8d2b6b5dfd4797b4f9f3aa6ea29253d0e615597077d1f3c1b1054ce5f')
options=("!strip")

package() {
  cd "${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

