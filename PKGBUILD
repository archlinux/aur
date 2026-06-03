# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.6.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell' 'moreutils: needed for sponge for CAPO_SHELL_KUBECONFIG_FILTER')
source=("$pkgname" "multi-capo-shell")
sha512sums=('2cb29d0f40d721101f58e1dc2bbd436d2a88fbead27f815239a3d97acf9870d0e292ddf91c5dd9dd1368bb092fffdaa36f7db6784f447afe92d5d8dd053b8e99'
            '8e5ccdc2544b26531b03865aa324e545c825baafeb9fd7928393789daa2db0a15d1002fe194aa65b7d92089c37d0a3921841d65b0b961a432b88d12299419216')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
