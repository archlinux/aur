# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=3.1.3
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
sha256sums_x86_64=('8ded7d361d9f73096a4a729d24ce4325353d84718fdd00a17879bf9d167fec06')
sha256sums_aarch64=('738f42b081a42ea9f358a7ec76cce9519b703c51ff9a3e5dc8b8b1ce29a27370')
sha256sums_armv7h=('39b82af69d20d65ca9490e7ec6ff2297138b4dd274e3ceafc833246dd2978b8f')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
