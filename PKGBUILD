# Maintainer : sebikul <sebikul@gmail.com>
#Contributed by Christian Rapp  <saedelaere.tv@gmail.com>, based on:
#Contributed by Peter Dennis <listen.ppublic@gmail.com>, based on PKGBUILD by:
#Contributor: Ariel Kanterewicz <asdkant@gmail.com>

pkgname=qbzr
pkgver=0.23.0
pkgrel=1
pkgdesc="A GUI front end for Bazaar based on the Qt toolkit."
arch=('i686' 'x86_64')
url="http://wiki.bazaar.canonical.com/QBzr"
license=('GPL')
depends=('python2-pyqt>=4' 'bzr' 'python2')
optdepends=('python2-pygments: for syntax highlighting'
'python2-pyenchant: for spell checking in commit dialogs')

source=("http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('bd000c87e9cfeb78ea6629a4bee65ee5')

build() {

	cd ${srcdir}/${pkgname}

	sed -i -e "s=/usr/bin/env python=/usr/bin/env python2=g" ./setup.py

	./setup.py build || return 1

	./setup.py install --prefix=$pkgdir/usr install

} 
