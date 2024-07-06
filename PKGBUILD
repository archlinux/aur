# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli-bin
_binname=privatebin
pkgver=2.0.2
pkgrel=1
pkgdesc='A powerful CLI for creating and managing PrivateBin pastes with ease - binary package'
arch=('x86_64' 'aarch64')
url='https://github.com/gearnode/privatebin'
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="$pkgname.install"
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('ed281014457eb14838cacea299cd04df59b1a332ec6de7563123d49bceecfd16')
sha256sums_aarch64=('ed281014457eb14838cacea299cd04df59b1a332ec6de7563123d49bceecfd16')

package() {
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
