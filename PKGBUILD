# contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>
# Contributor: Gustavo Alvarez <sl1pkn07 [at] gmail [dot] com>
# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=pyrit-svn
pkgver=308
pkgrel=7
pkgdesc="GPU-accelerated attack against WPA-PSK authentication, (SVN version)"
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
provides=('pyrit')
conflicts=('pyrit')
depends=('python2' 'libpcap')
makedepend=('svn')
optdepends=('cpyrit-calpp-svn: CAL++ backend'
            'cpyrit-cuda-svn: CUDA backend'
            'cpyrit-opencl-svn: OpenCL backend')

source=("svn+http://pyrit.googlecode.com/svn/trunk/pyrit")
md5sums=('SKIP')

pkgver() {
	cd pyrit

	svnversion
}

build() {
	cd pyrit

	python2 setup.py build
}

package() {
	cd pyrit

	python2 setup.py install --root="${pkgdir}" --optimize=1
}
