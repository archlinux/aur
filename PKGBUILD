# Author: Jochum D, jooch (at) gmx (dot) com>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild
pkgver=0.9.0
pkgrel=3
pkgdesc="Automatically build linux-ck kernels service"
arch=(any)
url="https://github.com/nebulosa2007/$pkgname"
license=(GPL-3.0-only)
depends=(
  bash
  git
)
optdepends=(
  'fzf: for selecting subarches'
  'nginx-mainline: to distribute packages'
  'modprobed-db: to adjust the list of kernel modules to compile'
  'pacman-contrib: package archive maintaining'
  'repoctl: powerfull tool for making local repository'
)
options=(!debug)
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname@.service
  $pkgname@.timer
)
b2sums=(
  '826ab3d8c3ebc67b4efffd2946fcf86217b2fd6dd8798bec395c059019355c6d0ae98755984c3b1b52005a9fae360612055958ecdbd0a54e6fcb59b64cfa5f48'
  '5ce5a992939bc79465f004a44ac4ddf33c15f9823ac9097e96c7f85e9b5ae903e9781cffd49ee7318cdeb77309131bc04be0a38b12fb8dcb40ded107399302a1'
  '783f392b4cfb2782d90dd370c965e6650bdc1888c0043a2129a6811488fbccec07e83a957a391c8f6aa9be82d7042316aae91103b55bd040d393d0b1bb1e9477'
)

package() {
  install -vDm755 $pkgname-$pkgver/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 $pkgname@.{service,timer} -t "$pkgdir"/usr/lib/systemd/system/
}
