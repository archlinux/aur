# Maintainer: Axilleas P <axilleas@archlinux.gr>

pkgname=python2-gitissius
pkgver=0.1.5
pkgrel=1
pkgdesc="A distributed bug tracker for git."
arch=(any)
url="http://gitissius.org"
license=('GPL3')
depends=('python2')
makedepends=('python2-distribute')
optdepends=('python2-colorama: for color support')
conflicts=('python2-gitissius-git')
source=("http://pypi.python.org/packages/source/G/Gitissius/Gitissius-${pkgver}.tar.gz")

build()

{ 
  
	#fix python2 issues
	cd "${srcdir}"/Gitissius-${pkgver}/gitissius
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' *.py
	
	cd "${srcdir}"/Gitissius-${pkgver}
	python2 setup.py install --root="${pkgdir}" -O1
} 
md5sums=('6f3042618777227be9dfc0185f2122f1')
