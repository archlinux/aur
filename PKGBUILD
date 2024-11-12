# Maintainer: Kilian "CaféHaine" GUILLAUME <kilian.guillaume@gmail.com>

pkgname=d8
pkgver=8.9
pkgrel=1
_commit=eaf64f278dd6de99cc2963842e99f718a894e596
pkgdesc='D8 is a dexer that converts java byte code to dex code.'
url='https://gitlab.com/android_translation_layer/d8'
arch=(any)
license=('Apache-2.0')
depends=()
makedepends=(
  jdk11-openjdk
  gradle
  protobuf
)
options=()
source=("${pkgname}-${_commit}::${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('c93e9989df4cea340386f1888e81dce8cdba1692c6ec47ba4bb695054bcc0e97')

build() {
  cd "${pkgname}-${_commit}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${_commit}"
  make \
    PREFIX="$pkgdir"/usr \
    install
}
