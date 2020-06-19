# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

_reponame=ncbi-genome-download
pkgname=python-ncbi-genome-download
pkgver=0.3.0
pkgrel=1
pkgdesc="Scripts to download genomes from the NCBI FTP servers"
arch=('any')
url="https://github.com/kblin/ncbi-genome-download"
license=('Apache')
depends=('python' 'python-setuptools' 'python-appdirs' 'python-requests')
source=(ncbi-genome-download-$pkgver.tar.gz::https://github.com/kblin/ncbi-genome-download/archive/$pkgver.tar.gz)
sha512sums=('5bcd6e0d731bc4bb6792821dc6d233e2f7acac6ee6819ddd14014a881d475c43ad084ff000d78e12fc2528d179be0e3db076fbe15da4b83dc6815c37c188ab61')

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
