# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

_reponame=ncbi-genome-download
pkgname=python-ncbi-genome-download
pkgver=0.3.1
pkgrel=1
pkgdesc="Scripts to download genomes from the NCBI FTP servers"
arch=('any')
url="https://github.com/kblin/ncbi-genome-download"
license=('Apache')
depends=('python' 'python-setuptools' 'python-appdirs' 'python-requests')
source=(ncbi-genome-download-$pkgver.tar.gz::https://github.com/kblin/ncbi-genome-download/archive/$pkgver.tar.gz)
sha512sums=('2364ef1945276e8c594aefd9613688a3cbfa54c8e68c819849853d8073525ec029d68b7e11a54830ad63219a3c5c6ddfdcf1ab7341caf9e0952a67f0b730616b')

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
