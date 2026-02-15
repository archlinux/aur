# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli-bin
_binname=privatebin
pkgver=2.2.0
pkgrel=1
pkgdesc='A powerful CLI for creating and managing PrivateBin pastes with ease - binary package'
arch=(x86_64 aarch64)
url='https://github.com/gearnode/privatebin'
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="$pkgname.install"
source_x86_64=("$pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v${pkgver}/${_binname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/${_binname}_Linux_arm64.tar.gz")

sha256sums_x86_64=('9b44d2fb65bba65e9459cd60ae78b1678b11d505e8450f23c1551dd57b2c6562')
sha256sums_aarch64=('f4afd229f4aff1e654755a17ed43c079c13b0e10e6163233a1097d6ec440b614')

package() {
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
