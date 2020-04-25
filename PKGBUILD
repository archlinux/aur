pkgname=bazel024-bin
pkgver=0.24.1
pkgrel=1
pkgdesc='Correct, reproducible, and fast builds for everyone'
arch=('x86_64')
license=('Apache')
url='https://bazel.io/'
depends=('java-environment=11' 'libarchive' 'zip' 'unzip')
makedepends=()
provides=("bazel=${pkgver}")
conflicts=('bazel')
options=('!strip')
source=("https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-installer-linux-x86_64.sh")
sha256sums=('cf8210e538c37f195298905301a1221ca5b6a5a6658ccd1c4369a867aa2339c3')

package() {
  sh bazel-${pkgver}-installer-linux-x86_64.sh --prefix="${pkgdir}/usr"
  rm "${pkgdir}"/usr/bin/bazel
  cd "${pkgdir}"/usr/bin && ln -s ../lib/bazel/bin/bazel bazel
}
