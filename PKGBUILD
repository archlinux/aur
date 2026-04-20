# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.4.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell' 'moreutils: needed for sponge for CAPO_SHELL_KUBECONFIG_FILTER')
source=("$pkgname" "multi-capo-shell")
sha512sums=('3f88b57b358bed41a34ba96f68e65ab0a04ceabbfbd5aa6bb92ec4980c1d2d83f8ba4c735516c5fee20aafd338c386de4d5fd74098070818aa455f31302e8ee0'
            '24753d9a0cdd55a2b8449ef093f4638c284a8a066d2b5481a6074ea99fae7163adb975b456f2b378d168529742b243f2ad4fdeb92b114c3951906558a06a0a15')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
