# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kpm
pkgver=v0.16.0
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
sha256sums=('c5da3b0a6f55228bf55039ee97786e624b9b8dbfd0e930d617bc412baedc30d4')

package() {
  # striping char from tag
  pkgtag=${pkgver:1}
  cd "$srcdir/$pkgname-$pkgtag"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
