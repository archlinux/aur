# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=mosdepth
pkgname=mosdepth-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing"
arch=('any')
url="https://github.com/brentp/mosdepth"
license=('MIT')
provides=('mosdepth')
conflicts=('mosdepth')
source=(
    https://github.com/brentp/"${_name}"/releases/download/v"${pkgver}"/"${_name}"
    "${_name}"-"${pkgver}".tar.gz::https://github.com/brentp/"${_name}"/archive/v"${pkgver}".tar.gz)
sha256sums=('0aaeb283b296e5ee0a2d819b4842b92289145ed17a37210144f0e02edd3629c4'
            'a05b3ef3c779c2155816954322adca2d7c06b3e19a409993020b9ad4bbd28dd4')

package() {
  install -Dm755 "${_name}" "${pkgdir}"/usr/bin/"${_name}"

  # Complete tar archive downloaded just for current license.
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${_name}"/LICENSE
}
