# Maintainer: Nikoloz Shvelidze <captain@pirrate.me>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Tim Brown <stimut@gmail.com>

pkgname=google-cloud-sdk-app-engine-java
pkgver=332.0.0
pkgrel=1
pkgdesc="A google-cloud-sdk component that provides the Java runtime for AppEngine."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
options=('!strip')
depends=(
  "google-cloud-sdk"
  "java-environment"
)
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
)
sha256sums=('0db18834eec2edc115a7a6597cb17518c8716e11a89a71cf732b887b55e96783')

package() {
  # Install the component manifest file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-java.manifest" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-java.manifest"

  # Install the component metadata snapshot file
  install -D -m 0644 \
    "${srcdir}/google-cloud-sdk/.install/app-engine-java.snapshot.json" \
    "${pkgdir}/opt/google-cloud-sdk/.install/app-engine-java.snapshot.json"

  # Install the component files
  mkdir -p "${pkgdir}/opt/google-cloud-sdk/platform"
  cp -R \
    "${srcdir}/google-cloud-sdk/platform/google_appengine" \
    "${pkgdir}/opt/google-cloud-sdk/platform/google_appengine"
}
