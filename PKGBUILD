# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.6.2
_srcname="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python>=3.6' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${_srcname}.tar.gz")
sha256sums=('276e98fed5e8e936e92343ac637c13567d2987757b26381e6cb14f9a71fb821a')

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
