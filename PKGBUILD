# Maintainer: Super Bo <supernbo@gmail.com>
pkgname=bazel31-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='Build and test software of any size, quickly and reliably.'
arch=('x86_64')
url='https://bazel.build'
license=('Apache')
depends=('java-environment=8')
provides=("${pkgname%-bin}" "bazel=${pkgver}")
conflicts=('bazel31' 'bazel3' 'bazel3-bin' 'bazel')
options=('!strip')
source=(
    "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-linux-x86_64"
)
noextract=("bazel_nojdk-${pkgver}-linux-x86_64")
sha256sums=(
    "605118766dbe07d04f4f15a809b231247eef3f302c431dcb712a514244662a47d3eb784add3b20d69d415954f7a95f9988215560911079289170a383343398d1"
)

package() {
    install -Dm755 bazel-${pkgver}-linux-x86_64 "${pkgdir}/usr/bin/bazel"
}
