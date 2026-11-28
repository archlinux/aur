# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rsvelte-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Rust-powered Svelte compiler and tooling"
arch=('x86_64' 'aarch64')
url="https://github.com/baseballyama/rsvelte"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/baseballyama/rsvelte/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rsvelte-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rsvelte-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('04c19e133e48dab0970673da2ae83eed4ebbd7b511a5ff380fc184b8d8368ba0')
sha256sums_x86_64=('ce6cd89b5ea0b5c8b522be46c15d6fc1f4478395b055052cabfbea808671b145')
sha256sums_aarch64=('ffc46a6c07edbf656cefd0e263b64401f2de7e6b9d14c014e0ff98b80321b9e5')

package() {
  install -Dm755 "./rsvelte" "${pkgdir}/usr/bin/rsvelte"
  install -Dm755 "./rsvelte-svelte-content-mapper" "${pkgdir}/usr/bin/rsvelte-svelte-content-mapper"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
