# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=deepchat
pkgver=0.4.2
pkgrel=1
pkgdesc="DeepChat - 连接强大AI与个人世界的智能助手 | DeepChat - A smart assistant that connects powerful AI to your personal world"
arch=('x86_64')
url="https://github.com/ThinkInAIXYZ/deepchat"
license=('Apache-2.0 license')
conflicts=(${pkgname})
provides=(${pkgname})
source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ThinkInAIXYZ/deepchat/releases/download/v${pkgver}/DeepChat-${pkgver}-linux-x64.tar.gz deepchat.desktop deepchat.png)
_install_path="/opt/DeepChat"

package() {
  install -dm755 "${pkgdir}/opt"

  mv -f "${srcdir}/DeepChat-${pkgver}-linux-x64" "${pkgdir}/${_install_path}"

  install -dm755 "${pkgdir}/usr/bin"

  ln -snf "${pkgdir}/${_install_path}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "deepchat.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deepchat.png"

  install -Dm644 "deepchat.desktop" "${pkgdir}/usr/share/applications/deepchat.desktop"
}

sha256sums_x86_64=('a0f68b58b51604f951e81204d4c92f181a5510db15a0fa47496f5f1e411a9a99'
                   '705b12f74b008451f1b0724f8e0540e2d99db594bea4ed1c35a3fa1faee626ae'
                   '68ebeeeaac56ed0b1c6d4e17d08fd59ef754c0bd395b53ee1d911bb7c8600a9d')