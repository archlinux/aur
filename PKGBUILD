# Author: Jochum D, jooch (at) gmx (dot) com>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=linux-ck-autobuild
pkgver=0.8.3
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
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        $pkgname@.service
        $pkgname@.timer)
b2sums=('241036c6342329f53b53d13e0725c5a6aa6bb641ba76b620620bd3b572c4d93db45a6dcbbbb0ede71ba043315fb887b991b26a2cd53123ff96b46b6dbe2e5599'
        '5ce5a992939bc79465f004a44ac4ddf33c15f9823ac9097e96c7f85e9b5ae903e9781cffd49ee7318cdeb77309131bc04be0a38b12fb8dcb40ded107399302a1'
        '783f392b4cfb2782d90dd370c965e6650bdc1888c0043a2129a6811488fbccec07e83a957a391c8f6aa9be82d7042316aae91103b55bd040d393d0b1bb1e9477')

package() {
    install -Dm755 $pkgname-$pkgver/$pkgname -t "$pkgdir"/usr/bin/
    install -Dm644 $pkgname@.{service,timer} -t "$pkgdir"/usr/lib/systemd/system/
}
