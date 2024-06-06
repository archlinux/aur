# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.52.2
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${_base}"
arch=(x86_64 i686 aarch64)
license=(GPL-3.0-or-later)
depends=(go)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_base}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('05eb11b50248b37edfad336ec5392af349e84cd34f487fe97a9a0081fd8475bc')
sha256sums_i686=('40e46e58ff8b11de9d11c17173b1b320e22aa0166475fd7751379728f4f897fb')
sha256sums_aarch64=('c898913867fd4b27a47b27f23263b8b872c1293d1943fffaf2e62a10ddebdb95')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
