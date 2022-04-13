# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=2.3.0
pkgrel=1
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
sha256sums_x86_64=('995613a18fbd702a65322649d77bc5800a5b88302766b42b07124b29df2eb22e')
sha256sums_aarch64=('a8b6342368b0211b111f08d7e1cfa58536f2087b98f4ab288476c292e6c889ab')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
