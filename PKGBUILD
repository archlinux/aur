# Maintainer: Jia Sui <jsfaint at gmail dot com>

pkgname=kubecm-git
_pkgname=kubecm
pkgver=v0.13.1
pkgrel=1
pkgdesc="Manage your kubeconfig more easily."
arch=('i686' 'x86_64')
url="https://github.com/sunny0826/kubecm"
makedepends=('make' 'git' 'go')
source=('git+https://github.com/sunny0826/kubecm.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags
}

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd "$srcdir"

  # binary
  install -Dm755 $_pkgname/target/${_pkgname}-${pkgver}/kubecm $pkgdir/usr/bin/kubecm
}

# vim:set ts=2 sw=2 ft=sh et:
