# Author: Jochum D, jooch (at) gmx (dot) com>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild
pkgver=0.8.1
pkgrel=1
pkgdesc="Automatically build linux-ck kernels service"
arch=(any)
url="https://github.com/nebulosa2007/$pkgname"
license=(GPL-3.0-only)
depends=(git)
optdepends=('fzf: for selecting subarches'
            'modprobed-db: to adjust the list of kernel modules to compile'
            'repoctl: powerfull tool for making local repository'
            'pacman-contrib: package archive maintaining'
            'nginx-mainline: to distribute packages')
options=(!debug)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
        $pkgname@.service
        $pkgname@.timer)
b2sums=('f11eff7471cdf3091d83d67e5889d15f6167d9dc66d642375dcdf5c35e97e407b2b05131a7d22e41411c378f9b139f301213b6f352819405d28f00b8b3a7b6ae'
        '5ce5a992939bc79465f004a44ac4ddf33c15f9823ac9097e96c7f85e9b5ae903e9781cffd49ee7318cdeb77309131bc04be0a38b12fb8dcb40ded107399302a1'
        '783f392b4cfb2782d90dd370c965e6650bdc1888c0043a2129a6811488fbccec07e83a957a391c8f6aa9be82d7042316aae91103b55bd040d393d0b1bb1e9477')

package() {
    install -Dm755 $pkgname-$pkgver/$pkgname -t $pkgdir/usr/bin/
    install -Dm644 $pkgname@.{service,timer} -t $pkgdir/usr/lib/systemd/system/
}
