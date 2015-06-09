# Maintainer: Axilleas Pipinellis <axilleas archlinux info>

pkgname=python2-commando
pkgver=0.3.4
pkgrel=1
pkgdesc="A declarative interface for argparse"
arch=('any')
url='http://github.com/lakshmivyas/commando'
license=('MIT')
makedepends=('python2' 'python2-distribute')
source=("http://pypi.python.org/packages/source/c/commando/commando-$pkgver.tar.gz")

prepare() {

  cd "${srcdir}"/commando-"$pkgver"
  sed -i 's|#!python|#!/usr/bin/env python2|' distribute_setup.py

}

package() {

  cd "${srcdir}"/commando-"$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python2 setup.py install --root="${pkgdir}" -O1
}

md5sums=('33c6ec2e7de6d24584fb08cc61029fc9')
