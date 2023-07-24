# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

_reponame=ncbi-genome-download
pkgname=python-ncbi-genome-download
pkgver=0.3.2
pkgrel=1
pkgdesc="Scripts to download genomes from the NCBI FTP servers"
arch=('any')
url="https://github.com/kblin/ncbi-genome-download"
license=('Apache')
depends=('python' 'python-setuptools' 'python-appdirs' 'python-requests' 'python-tqdm')
source=(ncbi-genome-download-$pkgver.tar.gz::https://github.com/kblin/ncbi-genome-download/archive/$pkgver.tar.gz)
sha256sums=('147b19908293b8c69782ac6734b79ba10dc78336820e3c469649723c5f6c4656')

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
