# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=csvtk
pkgname=csvtk-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A cross-platform, efficient and practical CSV/TSV toolkit in Golang"
arch=('x86_64')
url=http://bioinf.shenwei.me/csvtk
license=('MIT')
source=(
  "${_name}"-"${pkgver}"::https://github.com/shenwei356/"${_name}"/archive/v"${pkgver}".tar.gz
  "${_name}"-"${pkgver}"-binary::https://github.com/shenwei356/"${_name}"/releases/download/v"${pkgver}"/"${_name}"_linux_amd64.tar.gz
)
sha256sums=(
  'a1e5076a31f501344329272dab6144df777934c2a7fbbb5b1da11424827d412e'
  'fdf7beed8b83dc1ecdd61c69b4ececd81083cca336e0bc5a6244631133b915bb'
)

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_name}"/LICENSE
  install -Dm644 doc/docs/usage.md "${pkgdir}"/usr/share/doc/"${_name}"/usage.md
  install -Dm644 doc/docs/tutorial.md "${pkgdir}"/usr/share/doc/"${_name}"/tutorial.md

  cd "${srcdir}/"
  install -Dm755 "${_name}"-"${pkgver}"-binary "${pkgdir}"/usr/bin/"${_name}"
}
