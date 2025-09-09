# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli-bin
_binname=privatebin
pkgver=2.1.1
pkgrel=2
pkgdesc='A powerful CLI for creating and managing PrivateBin pastes with ease - binary package'
arch=(x86_64 aarch64)
url='https://github.com/gearnode/privatebin'
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="$pkgname.install"
source_x86_64=("$pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v${pkgver}/${_binname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/${_binname}_Linux_arm64.tar.gz")

sha256sums_x86_64=('edfd11a816207e2df9716ca2ba1e98da1b67b6bff89ae68380a52a46c8a5e145')
sha256sums_aarch64=('006bc22d1c6b0163b97d83c488a19bfc3bd28a79811809eb973ba5e182f54806')

package() {
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
