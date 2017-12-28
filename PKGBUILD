# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# imported from Arch Strike by GI_Jack
# Original PKGBUILD: ArchStrike <team@archstrike.org>

buildarch=1
pkgname=0trace
pkgver=20070125
pkgrel=1
pkgdesc='Tool for hop enumeration over an existing TCP connection. Traceroute alternative'
url='https://jon.oberheide.org/0trace'
arch=('any')
license=('GPL3')
depends=('libdnet' 'python2-dpkt' 'python2-pypcap' 'python2')
source=('https://jon.oberheide.org/files/0trace.py')
sha512sums=('790d8d96c98fffe0e79890688d137ad8e97ed6e9661cc3b764ec62ea74f4897c28a7f2e71d17720bb7957c4ee39decb3b6bceeb29d339e7fe765c3f12a7aa677')

prepare() {
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' ${pkgname}.py
}

package() {
  install -Dm755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"
}
