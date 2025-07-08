# Maintainer Chris Werner Rau <aur@cwrau.io>

_binname=kubectl-node_shell
pkgname=${_binname/_/-}
pkgver=1.11.0 # renovate: datasource=github-releases depName=kvaps/kubectl-node-shell
pkgrel=4
pkgdesc="Exec into node via kubectl"
url="https://github.com/kvaps/$pkgname"
license=('Apache-2.0')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "k9s-node-shell.yaml")
optdepends=(
  'k9s: to use the included k9s plugin'
)
sha512sums=('3db4fcb93c32b5c900f8e8e24359b1a41dccec480e799c041a54fec028e3ecf703a5a38480168551052f7839743cebadea4b482be21a6b13c351dd68dfa758fb'
            '68be04c97ce66c172836cefb3bb1a2ea23cb0e246164f15bfc3d1b5d9dad4542f13e851aeff1100d93572202973f601eb2c081da7754f42f8ff8fc3cb354940a')

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/$_binname" "$pkgdir/usr/bin/$_binname"
  install -D -m 0755 "$srcdir/k9s-node-shell.yaml" "$pkgdir/usr/share/k9s/plugins/node-shell.yaml"
}

#vim: syntax=sh
