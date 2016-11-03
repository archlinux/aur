# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>
# Contributor: Gustavo Alvarez <sl1pkn07 [at] gmail [dot] com>

pkgname=pyrit-git
pkgver=0.5.0.r21.g6111f10
pkgrel=1
pkgdesc="The famous WPA precomputed cracker (Git version)"
url="https://github.com/JPaulMora/Pyrit"
license=('GPL3')
arch=('i686' 'x86_64')
provides=('pyrit' 'pyrit-svn')
conflicts=('pyrit' 'pyrit-svn')
replaces=('pyrit-svn')
depends=('python2' 'libpcap' 'openssl' 'zlib' 'scapy' 'python2-psycopg2')
makedepends=('git')
optdepends=('pyrit-cuda-git: CUDA backend'
            'pyrit-opencl-git: OpenCL backend')

source=("git://github.com/JPaulMora/Pyrit")
md5sums=('SKIP')

function pkgver() {
	cd Pyrit

	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd Pyrit

	python2 setup.py build
}

package() {
	cd Pyrit

	python2 setup.py install --root="${pkgdir}" --optimize=1
}
