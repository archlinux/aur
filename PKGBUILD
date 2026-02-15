# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli-bin
_binname=privatebin
pkgver=2.2.1
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

sha256sums_x86_64=('ad83bd5319317aee7c0682e1839da13d0ab7a2494323914103a842899c0ef1ad')
sha256sums_aarch64=('7e87149da80b8d9ea9f6757b661126c36e86cb38c7a11aa1917dd23e19923ffc')

package() {
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
