# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgbase=python-iwscan
pkgname=python2-iwscan
pkgver=20090609
pkgrel=5
pkgdesc="A Python interface to iwlist, using the iwlib library"
arch=('x86_64')
url="http://projects.otaku42.de/browser/python-iwscan"
license=('LGPL')
depends=('python2' 'wireless_tools')
conflicts=('python-iwscan<=20090609-3')
replaces=('python-iwscan<=20090609-3')
source=(https://sources.archlinux.org/other/${pkgbase}/${pkgbase}-20090609.tar.gz)
md5sums=('30fbe8ad3b07e67c1c35db2de16077d8')

prepare() {
	cd ${pkgbase}
	sed -i 's|PROC_NET_WIRELESS|"/proc/net/wireless"|' pyiwscan.c
}

build() {
	cd ${pkgbase}
	python2 setup.py build
}

package_python2-iwscan() {
	cd ${pkgbase}
	python2 setup.py install --root="${pkgdir}"
}
