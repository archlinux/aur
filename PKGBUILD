# Maintainer: Rin Leaf <tiflew123 at gmail dot com>
pkgname=sftool-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="CLI version of sftool, a download tool for the SiFli family of chips"
arch=('x86_64' 'aarch64')
conflicts=('sftool-gui-bin')
url="https://github.com/OpenSiFli/sftool"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  'libcap'
  'systemd-libs'
)
makedepends+=(
	"libarchive"
)
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/${pkgver}/sftool-${pkgver}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/sftool-${pkgver}-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('5d93ec1f66f3b8fa876b2894ab396cf5af09759a2d6186d16a203ad954b29db8')
sha256sums_aarch64=('78879f236adb3bf3a0fbde886c0c723d8d7c8e0857f05921c573fdaa36224e2c')

function package() {
  install -Dm755 sftool "${pkgdir}/usr/bin/sftool"
}

