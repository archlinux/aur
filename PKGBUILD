#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Zachary Hanham <z@zmhanham.com>
_org=agentclientprotocol
_realname=claude-agent-acp
_alias=claude-code-acp
pkgname=${_realname}-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed! (precompiled binary)"
url="https://github.com/${_org}/${_realname}"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
conflicts=("${_realname}" "${_alias}")
provides=("${_realname}" "${_alias}")
options=(!strip)

source_x86_64=("${_realname}-${pkgver}-${pkgrel}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-x64.tar.gz")
sha256sums_x86_64=('a6e11b3929240b27a784d10bfe2a13616ad7a8016b56253d82a7a8b86985fcb3')

source_aarch64=("${_realname}-${pkgver}-${pkgrel}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-arm64.tar.gz")
sha256sums_aarch64=('cdd21e3345ef0f8d6e10075cd4e8beb457b94f7edd20c5831e5d171a68670ddf')

package() {
  install -Dm755 "${srcdir}/${_realname}" "${pkgdir}/usr/bin/${_realname}"
  ln -s "${_realname}" "${pkgdir}/usr/bin/${_alias}"
}
