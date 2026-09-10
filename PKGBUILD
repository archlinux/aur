# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=capo-shell
pkgver=2.0.0
pkgrel=1
pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and OS_ environment variables to interact with cluster-api-provider-openstack clusters"
license=('APACHE')
arch=('any')
depends=('kubectl' 'yq')
optdepends=('fzf: needed for multi-capo-shell')
source=("$pkgname" "multi-capo-shell")
sha512sums=('3372c547a6ddba7482a7f4554aaff606478131ab31cf87139899aae6964c9f5df0f4fabcb86524903e108bdd2620b878cae19fb4196ab3a46ba7953bd48e3949'
            '39083d3253f1394a589083f1314f7cc8980ab454fb3b088315c321ff5669ae20e4f12544cbda970284812201506b77b4f1c7ddd0baab191d7dd45f77eedd5029')

package() {
  for file in "${source[@]}"; do
    install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/$file"
  done
}

#vim: syntax=sh
