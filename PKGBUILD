#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Zachary Hanham <z@zmhanham.com>
_org=agentclientprotocol
_realname=claude-agent-acp
_alias=claude-code-acp
pkgname=${_realname}-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed! (precompiled binary)"
url="https://github.com/${_org}/${_realname}"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
conflicts=("${_realname}" "${_alias}")
provides=("${_realname}" "${_alias}")
options=(!strip)

source_x86_64=("${_realname}-${pkgver}-${pkgrel}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-x64.tar.gz")
sha256sums_x86_64=('6f412ec6a94c3303d3b9f6049f62a66d67cf4dd0ecae2b7c6d1f246d55efbffc')

source_aarch64=("${_realname}-${pkgver}-${pkgrel}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-arm64.tar.gz")
sha256sums_aarch64=('590e3096ccfbf9d72f7db4abe8c180e605ccfb467223d481db727c358da191ac')

package() {
  install -Dm755 "${srcdir}/${_realname}" "${pkgdir}/usr/bin/${_realname}"
  ln -s "${_realname}" "${pkgdir}/usr/bin/${_alias}"
}
