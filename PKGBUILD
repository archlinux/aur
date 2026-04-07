#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Zachary Hanham <z@zmhanham.com>
_org=agentclientprotocol
_realname=claude-agent-acp
_alias=claude-code-acp
pkgname=${_realname}-bin
pkgver=0.25.3
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed! (precompiled binary)"
url="https://github.com/${_org}/${_realname}"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
conflicts=("${_realname}" "${_alias}")
provides=("${_realname}" "${_alias}")
options=(!strip)

source_x86_64=("${_realname}-${pkgver}-${pkgrel}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-x64.tar.gz")
sha256sums_x86_64=('451bfbf88e575c44e60e95f7eacf5b8a9d33613d6c7ce614b255b8a15ece7f44')

source_aarch64=("${_realname}-${pkgver}-${pkgrel}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-arm64.tar.gz")
sha256sums_aarch64=('4ba2ee2d38a5437da21ce67f0f42cdb4c382881f4fac4aec57aa1dfb16ddfb42')

package() {
  install -Dm755 "${srcdir}/${_realname}" "${pkgdir}/usr/bin/${_realname}"
  ln -s "${_realname}" "${pkgdir}/usr/bin/${_alias}"
}
