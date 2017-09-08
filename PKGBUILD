# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-opencl
pkgver=0.4.0
pkgrel=3
pkgdesc="OpenCL backend for accelerated attack against WPA-PSK authentication."
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'openssl' 'zlib' 'libclc' 'pyrit')
makedepends=('opencl-headers' 'gcc' 'python2')

optdepends=('opencl-catalyst: OpenCL implemention from AMD')
conflicts=('cpyrit-calpp-svn' 'cpyrit-calpp' 'cpyrit-opencl' 'cpyrit-cuda')

source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pyrit/${pkgname}-${pkgver}.tar.gz)
md5sums=('9aea58eb00a147ed4e76802bb02541c5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build

}

package () {
    cd ${srcdir}/${pkgname}-${pkgver}
   python2 setup.py install --root=${pkgdir}
}
