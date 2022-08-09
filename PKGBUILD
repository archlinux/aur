# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Tim Brown <stimut@gmail.com>

# For ISSUES, REQUESTS, and QUESTIONS:
# https://github.com/sudoforge/pkgbuilds

pkgname=google-cloud-sdk-app-engine-python-extras
pkgver=397.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides extra libraries for the Python runtime for AppEngine."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
  "google-cloud-sdk-app-engine-python"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
)
sha256sums=('b264d751bef154a55e84ee26fc17a99a9944b1bd1b07e7daee9b3245424efd55')

package() {
  # Install the component manifest file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python-extras.manifest" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python-extras.manifest"

  # Install the component metadata snapshot file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-python-extras.snapshot.json" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-python-extras.snapshot.json"

  # Install the component files
  mkdir -p "${pkgdir}/opt/google-cloud-sdk/platform"
  cp -R \
    "${srcdir}/google-cloud-sdk/platform/google_appengine" \
    "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"
}
