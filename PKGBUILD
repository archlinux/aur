# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

_reponame=ncbi-genome-download
pkgname=python-ncbi-genome-download
pkgver=0.2.12
pkgrel=1
pkgdesc="Scripts to download genomes from the NCBI FTP servers"
arch=('any')
url="https://github.com/kblin/ncbi-genome-download"
license=('Apache')
depends=('python' 'python-setuptools' 'python-appdirs' 'python-requests')
makedepends=('python-pytest'  'python-coverage' 'python-pytest-cov' 'python-requests-mock' 'python-pytest-mock')
source=(ncbi-genome-download-$pkgver.tar.gz::https://github.com/kblin/ncbi-genome-download/archive/$pkgver.tar.gz)
sha256sums=('cf5f733b31b5982ab05a33513dacc54cda7c47bb7aeb91944427bbb259303907')

build() {
  cd "${srcdir}"/${_reponame}-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/${_reponame}-$pkgver
  python setup.py install --root="${pkgdir}"/ --optimize=1
  install -D LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

# vim:ts=2:sw=2:et:
