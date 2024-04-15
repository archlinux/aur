# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli-bin
_binname=privatebin
pkgver=2.0.1
pkgrel=1
pkgdesc='CLI for privatebin server'
arch=('x86_64' 'aarch64')
url='https://github.com/gearnode/privatebin'
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=(!lto)
install="$pkgname.install"
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('9192e7d6f8eb78e1a511f7f1ce5a2854f923e363c4e3e30134a387b8f2305f03')
sha256sums_aarch64=('cbf42d94a25f220330b76ce11deb4a185b385863bde9d2a72febf6fe3b1336ac')

package() {
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
