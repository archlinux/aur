# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.5.0
_srcname="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python>=3.6' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${_srcname}.tar.gz")
sha256sums=('c1016c73fe707d23fb060720bc6978ba4ac931403bc0f0472a90bd914bb57db5')

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
