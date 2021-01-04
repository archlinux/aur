# Maintainer: Axilleas P <axilleas@archlinux.gr>

pkgname=python2-gitissius
_pyname=Gitissius
pkgver=0.1.6
pkgrel=1
pkgdesc="A distributed bug tracker for git."
arch=(any)
url="https://github.com/glogiotatidis/gitissius"
license=('GPL3')
depends=('python2')
makedepends=('python2-distribute')
optdepends=('python2-colorama: for color support')
conflicts=('python2-gitissius-git')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")

package()
{
	#fix python2 issues
	cd "${srcdir}"/Gitissius-${pkgver}/gitissius
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' *.py

	cd "${srcdir}"/Gitissius-${pkgver}
	python2 setup.py install --root="${pkgdir}" -O1
}
sha256sums=('f3956d32e14b441df3883dbff557466cbd1cc78085aabcac6ec21e106312947b')
