# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=3.0.0
pkgrel=1
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
source_armv7h=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm.tar.gz")
sha256sums_x86_64=('0eb0a8c8bef727c1d80171428e804d0702930aafe777f407f21554b382da14e5')
sha256sums_aarch64=('7a689011d47aa9ead0fde597fcacd512964e5eb43de9c916a3fa074b17d77392')
sha256sums_armv7h=('3742e503723c99a704536ac0a3ca7e0e92821f0303d7c1b977f7785a8832b990')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
