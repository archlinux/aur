# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.8.1
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('fe792710447f17078ad4e34a8b46d133fc610163d266f401562f3d3911c143e7edcd600b2b42836b24d74a5eb5ab16633fcaec4e15139d98d5970c90872f27bf'
            '8e5ccdc2544b26531b03865aa324e545c825baafeb9fd7928393789daa2db0a15d1002fe194aa65b7d92089c37d0a3921841d65b0b961a432b88d12299419216')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
