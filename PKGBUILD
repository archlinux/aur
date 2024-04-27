# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Konstantin Gizdov <arch@kge.pw>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname='python2-nose'
pkgver=1.3.7
pkgrel=14
pkgdesc='A discovery-based unittest extension (deprecated)'
arch=('any')
url="https://pypi.org/project/nose/"
license=('LGPL2.1')
makedepends=('python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-${pkgver}.tar.gz")
b2sums=('4bb479b2786f813f9e9a5fd401e30023a473a053ae013d7887be15af415422c09fb399af6058ae99ed65c5fa4da84eb274eb805e895ca74db159d952905f5be4')

build() {
  cd "nose-${pkgver}"

  sed -e "s:man/man1:share/man/man1:g" -i setup.py
}

package() {
  cd "nose-${pkgver}"

  python2 setup.py install --root="${pkgdir}"

  mv "${pkgdir}/usr/bin/nosetests" "${pkgdir}/usr/bin/nosetests2"
  rm -rf "${pkgdir}/usr/share"
}
