# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.6.0
_srcname="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python>=3.6')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${_srcname}.tar.gz")
sha256sums=('29695535f462cf796f41f420c34230491201cf0674cd385d69b000d92c49f9ce')

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
