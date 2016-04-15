# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kpm
pkgver=v0.12.0
pkgrel=1
pkgdesc="CLI to deploy and manage applications stack on Kubernetes"
arch=('any')
url="https://github.com/kubespray/kpm"
license=('Apache')
groups=()
depends=('python2' 'python2-yaml' 'python2-jinja' 'python-requests' 'python2-jsonpatch' 'python2-tabulate' 'python2-termcolor')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::https://github.com/kubespray/kpm/archive/$pkgver.zip")
sha256sums=('3c519e62a4297752301cba63e19a8347cfa871b982c91ad797cb7f1f7f253cf9')

package() {
  # striping char from tag
  pkgtag=${pkgver:1}
  cd "$srcdir/$pkgname-$pkgtag"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
