# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=python-bpsproxy
_module='bpsproxy'
pkgver=0.2.1
pkgrel=1
pkgdesc="Blender Power Sequencer proxy generator tool"
url="https://github.com/GDquest/BPSProxy"
depends=('python' 'python-tqdm' 'ffmpeg')
makedepends=('python-setuptools' 'pandoc')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/36/91/66a1a8918566223204bf6b6ee6b81ede36f6bde021dd61c4ef9252d502c6/bpsproxy-${pkgver}.tar.gz")
sha256sums=('0aa366568abd4dd182d94a53af40ac3f86b358ba89547a1de9be30ec48a4cd91')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  pandoc README.rst -o README.md
  python setup.py build
}

package() {
  depends+=()
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
