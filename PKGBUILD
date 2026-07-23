# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=1.8.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('c754d773a88951a15e0722ab965348204e1ac9825bcb3423a3da5858fe16c89df694f22cdfbcb3f405ca46946654f6b5a759e0c9b8bac776073c17c2f659fe7f'
            '8e5ccdc2544b26531b03865aa324e545c825baafeb9fd7928393789daa2db0a15d1002fe194aa65b7d92089c37d0a3921841d65b0b961a432b88d12299419216')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
