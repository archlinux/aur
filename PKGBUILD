# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: David Donchez <david.donchez@gmail.com>

pkgname=kpm
pkgver=0.25.0
pkgrel=1
pkgdesc="KPM is a tool to deploy and manage application stacks on Kubernetes."
arch=('any')
url="https://github.com/coreos/kpm"
license=('Apache')
depends=('python2' 'python2-yaml' 'python2-jinja' 'python2-requests' 'python2-jsonpatch' 'python2-tabulate' 'python2-termcolor')
options=(!emptydirs)
source=("$pkgname.zip::https://github.com/coreos/kpm/archive/v$pkgver.zip")
sha256sums=('7167842c1758fa30bd3a2c68bd9f9aa18669d73f6f92848d9c2339d65a8024b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
