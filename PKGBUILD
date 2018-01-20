# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=mosdepth
pkgname=mosdepth-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing"
arch=('any')
url="https://github.com/brentp/mosdepth"
license=('MIT')
provides=('mosdepth')
conflicts=('mosdepth')
source=(
    https://github.com/brentp/"${_name}"/releases/download/v"${pkgver}"/"${_name}"
    "${_name}"-"${pkgver}".tar.gz::https://github.com/brentp/"${_name}"/archive/v"${pkgver}".tar.gz)
sha256sums=(
    '6e3dbd2ac93ee9e770f922de4b1641882558e1e70cf2168e509c6bc07d9486e7'
    '7aadd0f322a50723a5b396cfe8eb640728be03918a8d41b5a8ab1ba4943c26c6')

package() {
  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"

  # Complete tar archive downloaded just for current license.
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_name}"/LICENSE
}
