#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Zachary Hanham <z@zmhanham.com>
_org=zed-industries
_realname=claude-agent-acp
_alias=claude-code-acp
pkgname=${_realname}-bin
pkgver=0.22.2
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed! (precompiled binary)"
url="https://github.com/${_org}/${_realname}"
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
conflicts=("${_realname}" "${_alias}")
provides=("${_realname}" "${_alias}")
options=(!strip)

source_x86_64=("${_realname}-${pkgver}-${pkgrel}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-x64.tar.gz")
sha256sums_x86_64=('511da44ceee759985df829387d0e639b5b829367542cfe77a3338311f4fd61e5')

source_aarch64=("${_realname}-${pkgver}-${pkgrel}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_realname}-linux-arm64.tar.gz")
sha256sums_aarch64=('dd9176743c31a2f7611cd6a48d878f0d17442a9f33810cacca7819e081543357')

package() {
  install -Dm755 "${srcdir}/${_realname}" "${pkgdir}/usr/bin/${_realname}"
  ln -s "${_realname}" "${pkgdir}/usr/bin/${_alias}"
}
