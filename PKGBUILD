# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=2.3.1
pkgrel=1
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
sha256sums_x86_64=('b8d76483a3d2d8d53b45df417475d179106e71e0b61f1f66753d41e16de8f375')
sha256sums_aarch64=('7b5748548523faf41de58e544412cc22287883fc51e09b57c105afc8042b8dc9')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
