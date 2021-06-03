# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=5.0.0
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
depends=('nemo-python>=3.9.0')
makedepends=('python-distutils-extra' 'git')
options=('!libtool' '!emptydirs')
#_commit='1f21b0d12ad1be80f8be218fc3a08d0fe9cbd8b0'
#source=("git+https://github.com/linuxmint/nemo-extensions#commit=${_commit}")
#sha256sums=('SKIP')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('e9d0e592a8b8bc0a4f0eb5222994f522f0e255f5a0c86e8069933864e2ca7485')

package() {
#  cd "${srcdir}/nemo-extensions/${pkgname}"
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
