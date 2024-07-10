# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.10.1
pkgrel=2
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('APACHE')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "k9s-node-shell.yaml")
optdepends=(
  'k9s: to use the included k9s plugin'
)
sha512sums=('ee2e164680daac5d52a35c56a94d8bd6b178420a716bbde8e8e0e1db640217f55b6ee27fdba3ab95f8a115256fca8cf13a92e6d341e944522c08e71f56046773'
            '68be04c97ce66c172836cefb3bb1a2ea23cb0e246164f15bfc3d1b5d9dad4542f13e851aeff1100d93572202973f601eb2c081da7754f42f8ff8fc3cb354940a')

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/$_binname" "$pkgdir/usr/bin/$_binname"
  install -D -m 0755 "$srcdir/k9s-node-shell.yaml" "$pkgdir/usr/share/k9s/plugins/node-shell.yaml"
}

#vim: syntax=sh
