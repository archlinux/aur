#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Zachary Hanham <z@zmhanham.com>
_org=agentclientprotocol
_realname=claude-agent-acp
_alias=claude-code-acp
pkgname=${_realname}-bin
pkgver=0.24.2
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed! (precompiled binary)"
url="https://github.com/${_org}/${_realname}"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
conflicts=("${_realname}" "${_alias}")
provides=("${_realname}" "${_alias}")
options=(!strip)

source_x86_64=("${_realname}-${pkgver}-${pkgrel}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-x64.tar.gz")
sha256sums_x86_64=('a8611f547b14852e35963def6781be4b40aa180468186ef8213b656f7236ac74')

source_aarch64=("${_realname}-${pkgver}-${pkgrel}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-arm64.tar.gz")
sha256sums_aarch64=('2f7f627764280474bd6beaf618a017fdf3cc1591cd3320086c4a9d6232dbaf7c')

package() {
  install -Dm755 "${srcdir}/${_realname}" "${pkgdir}/usr/bin/${_realname}"
  ln -s "${_realname}" "${pkgdir}/usr/bin/${_alias}"
}
