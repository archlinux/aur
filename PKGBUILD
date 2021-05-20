# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Greg Darke <darke+arch@google.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=google-cloud-sdk-datastore-emulator
pkgver=341.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides local emulation of a Datastore environment."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
  "java-runtime"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
)
sha256sums=('59f77acc4e66692992bcf43101a565100d0989343199244a31bc8cb16a8ee4f6')

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/google-cloud-sdk" "${pkgdir}/opt"

  # Remove unneeded files
  rm "${pkgdir}/opt/google-cloud-sdk/platform/cloud-datastore-emulator/cloud_datastore_emulator.cmd"
  rmdir "${pkgdir}/opt/google-cloud-sdk/.install/.download"
}
