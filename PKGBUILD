# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-cuda
pkgver=0.4.0
pkgrel=2
pkgdesc="Pyrit support for Nvidia-CUDA."
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'openssl' 'zlib' 'nvidia' 'pyrit')
makedepends=('gcc' 'python2' 'cuda')
source=(http://pyrit.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('e3eaf2bbd841409326670cb8f501f2c6')

build() {
 #sed -e "s|'/opt/cuda'|'/opt/cuda-toolkit'|" -e "s|' --host-compilation C'||" -i setup.py
echo "ln -s /opt/cuda-toolkit /opt/cuda"
cd ${srcdir}/${pkgname}-${pkgver}
python2 setup.py build
python2 setup.py install --root=${pkgdir}
}
