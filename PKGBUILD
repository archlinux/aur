# Maintainer: mapleafgo <mapleafgo at 163 dot com>

pkgname=linux-wechat
_pkgname=wechat
pkgver=4.0.1.11
pkgrel=1
pkgdesc='linux wechat from Tencent'
arch=('x86_64' 'aarch64' 'loongarch64')
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-appimage")
provides=("${_pkgname}")
url='https://linux.weixin.qq.com/'
license=('custom: commercial')
depends=('noto-fonts-cjk' 'noto-fonts-emoji')

_base_url='https://dldir1v6.qq.com/weixin/Universal/Linux'
source_x86_64=("WeChatLinux_x86_64.deb::${_base_url}/WeChatLinux_x86_64.deb")
source_aarch64=("WeChatLinux_arm64.deb::${_base_url}/WeChatLinux_arm64.deb")
source_loongarch64=("WeChatLinux_LoongArch.deb::${_base_url}/WeChatLinux_LoongArch.deb")

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -snf /opt/wechat/wechat "${pkgdir}/usr/bin/wechat"
}
sha256sums_x86_64=('16410e0ca7895e5aa375282de5e48b2d5fcb958b063de6b2dcfd02bed190cc01')
sha256sums_aarch64=('59805ad7335de5ebb1fd5748d19b2f39761a085a45be30906810756d066277bc')
sha256sums_loongarch64=('f6df1547bf93f6f0817ae4845227cd2917fda414f3255088bb6961e064c7b112')