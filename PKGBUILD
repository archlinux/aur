# Author: Jochum D, jooch (at) gmx (dot) com>
# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild
pkgver=0.7.5
pkgrel=2
pkgdesc="Automatically build linux-ck kernels service"
arch=(any)
url="https://github.com/nebulosa2007/${pkgname}"
license=(GPL3)
depends=(base-devel git)
optdepends=('fzf: for selecting subarches')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        ${pkgname}@.service
        ${pkgname}@.timer)
b2sums=('2ce8d8c72c408a30db3150c538a404283b0bd2685d2556a19fc8fe80a6b37d0cdd261a60ea9fe6208fd09dec07917b4802122cbda5da0a9ae4e8667f8a24e8b6'
        '5ce5a992939bc79465f004a44ac4ddf33c15f9823ac9097e96c7f85e9b5ae903e9781cffd49ee7318cdeb77309131bc04be0a38b12fb8dcb40ded107399302a1'
        '783f392b4cfb2782d90dd370c965e6650bdc1888c0043a2129a6811488fbccec07e83a957a391c8f6aa9be82d7042316aae91103b55bd040d393d0b1bb1e9477')

package() {
  install -Dm755 ${pkgname}-${pkgver}/${pkgname}       -t ${pkgdir}/usr/bin/
  install -Dm644 ${srcdir}/${pkgname}@.{service,timer} -t ${pkgdir}/usr/lib/systemd/system/
}
