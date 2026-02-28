#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer: Duncan <duncan@mac-vicar.eu>
# Co-Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
org=zed-industries
realname=claude-agent-acp
pkgname=$realname
pkgver=0.19.2
pkgrel=1
pkgdesc="Use Claude Agent from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
conflicts=('claude-code-acp')
provides=('claude-code-acp')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('0f12911e763ffb63e40d904c4a66cba47a5b1a5d73a0f7b80a7a9ab0246cff95')
options=(!strip !debug)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
  ln -s claude-agent-acp "${pkgdir}/usr/bin/claude-code-acp"
}
