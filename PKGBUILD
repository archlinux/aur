# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=rakkess
pkgname=kubectl-$_pkgname-bin
pkgver=0.5.0 # renovate: datasource=github-releases depName=corneliusweig/rakkess
pkgrel=3
pkgdesc="Review Access - kubectl plugin to show an access matrix for k8s server resources"
url="https://github.com/corneliusweig/$_pkgname"
license=('Apache-2.0')
arch=('x86_64')
provides=(kubectl-$_pkgname)
source=("$_pkgname-$pkgver.tar.gz::${url/$_pkgname/rakkess}/releases/download/v$pkgver/${_pkgname}-amd64-linux.tar.gz")
sha512sums=('55199498f41c7c3ee11b3a23e0547d888ea0ec2e069e975f2b8c352cc6d5b4ed7271600aea99364d369648b40231a025578d03316c3c61e2c193b08b7237568f')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
  install -D -m 0755 $srcdir/$_pkgname-amd64-linux $pkgdir/usr/bin/kubectl-${_pkgname/-/_}
}

#vim: syntax=sh
