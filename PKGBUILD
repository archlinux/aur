# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=bazel40-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='Correct, reproducible, and fast builds for everyone'
arch=('x86_64')
url='https://bazel.build'
license=('Apache')
depends=('java-environment=11')
provides=("${pkgname%-bin}" "bazel=${pkgver}")
conflicts=('bazel' 'bazel3-bin' 'bazel2' 'bazel024' 'bazel024-bin' 'bazel-git')
options=('!strip')
source=(
    "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-linux-${arch}"
)
noextract=("bazel_nojdk-${pkgver}-linux-${arch}")
sha256sums=("7bee349a626281fc8b8d04a7a0b0358492712377400ab12533aeb39c2eb2b901")

package() {
    install -Dm755 bazel-${pkgver}-linux-${arch} "${pkgdir}/usr/local/bin/bazel"
}
