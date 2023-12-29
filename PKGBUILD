# Author: Jochum D, jooch (at) gmx (dot) com>
# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild
pkgver=0.7.3
pkgrel=2
pkgdesc="A tool to automatically build linux-ck kernels on a headless machines"
arch=(any)
url="https://github.com/nebulosa2007/${pkgname}"
license=(GPL3)
depends=(base-devel bash git)
optdepends=('fzf: for selecting subarches')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        ${pkgname}@.service
        ${pkgname}@.timer)
sha256sums=('4d6f6d08c5d0bae2d5e4bdf44e85066cb8d679de66acf5460c71f1930e2da150'
            '54e81f184026efe2e3076ff99388c1d75376c7d1739d3d23a4a469d46a596c69'
            'c4580b194309c53916ae76903876b585c845193e86f7c48ca86eb6cb36dd3236')
package() {
  install -Dm755 ${pkgname}-${pkgver}/${pkgname}       -t ${pkgdir}/usr/bin/
  install -Dm644 ${srcdir}/${pkgname}@.{service,timer} -t ${pkgdir}/usr/lib/systemd/system/
}
