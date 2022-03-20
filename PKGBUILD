# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=2.1.0
pkgrel=1
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
sha256sums_x86_64=('c2e5384794db7352d3b2f78bdc965a707968600481df00c90ccd4167bb24e701')
sha256sums_aarch64=('ad2b20d01509b6bf232f3ec2c92c8e3164191b66dc1841319df59ec439d2d16f')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
