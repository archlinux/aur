# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=2.0.3
pkgrel=2
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
sha256sums_x86_64=('ef8612cdd4ea7c232dc4f3fd5aadf92e56e1769a944fe76c640a8841a409bdf8')
sha256sums_aarch64=('cf646f058b1d52d063b4225fa311caf22aa80931db66dd4c79dba35f03e344c7')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
