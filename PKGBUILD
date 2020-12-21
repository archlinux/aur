# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=4.8.1
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
depends=('nemo-python>=3.9.0')
makedepends=('python-distutils-extra' 'git')
options=('!libtool' '!emptydirs')
_commit='1f21b0d12ad1be80f8be218fc3a08d0fe9cbd8b0'
source=("git+https://github.com/linuxmint/nemo-extensions#commit=${_commit}")
sha256sums=('SKIP')
#source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
#sha256sums=('1b7b85b41c659fe0f93a9b83fadb81a7934c7e7cb2df9eda4a03413b7f5d05c4')

package() {
  cd "${srcdir}/nemo-extensions/${pkgname}"
#  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
