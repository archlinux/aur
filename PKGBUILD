# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kpm
pkgver=v0.14.4
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
sha256sums=('07c6599e62dcc7eb27a54d03863e9795c406f509ff443adaf770ffaac3574c5c')

package() {
  # striping char from tag
  pkgtag=${pkgver:1}
  cd "$srcdir/$pkgname-$pkgtag"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
