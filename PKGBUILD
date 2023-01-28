# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=2.4.1
pkgrel=1
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
sha256sums_x86_64=('98b23afb387640e5d8b684e4b7a2afc50945f252fea49b89770035988c144f2b')
sha256sums_aarch64=('a44d305ef9e52d1af6f72bf77c10d39a83becf00668a1f2e26d82fb670f10f55')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
