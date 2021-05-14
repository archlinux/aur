# Maintainer: Super Bo <supernbo@gmail.com>
pkgname=bazel3-bin
pkgver=3.7.2
pkgrel=1
pkgdesc='Build and test software of any size, quickly and reliably.'
arch=('x86_64')
url='https://bazel.build'
license=('Apache')
depends=('java-environment=11')
provides=("${pkgname%-bin}" "bazel=${pkgver}")
conflicts=('bazel3' 'bazel')
options=('!strip')
source=(
    "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel_nojdk-${pkgver}-linux-x86_64"
)
noextract=("bazel_nojdk-${pkgver}-linux-x86_64")
sha256sums=(
    "dbf43bf909d2dbdd428820a6794d668404edcf1e15f20475837e568c83c9cd7b"
)

package() {
    install -Dm755 bazel_nojdk-${pkgver}-linux-x86_64 "${pkgdir}/usr/bin/bazel"
}
