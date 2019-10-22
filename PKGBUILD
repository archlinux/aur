# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=python-bpsproxy
_module='BPSProxy'
pkgver=0.2.0
pkgrel=2
pkgdesc="Blender Power Sequencer proxy generator tool"
url="https://github.com/GDquest/BPSProxy"
depends=('python' 'python-tqdm' 'ffmpeg')
makedepends=('python-setuptools' 'pandoc')
license=('GPL')
arch=('any')
source=("https://github.com/GDquest/BPSProxy/archive/${pkgver}.tar.gz")
sha256sums=('c264b23ae19b41e19a99c0473b07dbf650a43ed5629de51c410da8d980211a55')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  pandoc README.md -o README.rst
  python setup.py build
}

package() {
  depends+=()
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
