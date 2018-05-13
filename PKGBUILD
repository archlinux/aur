# Contributor: Andrew Rabert <draje@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.3.0
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python>=3.6' 'python-requests')
source=("https://github.com/nvllsvm/linode-dynamic-dns/archive/${pkgver}.tar.gz")
sha256sums=('831b01c8d8068d5ae95924fb87671f9f8973405913c5da6b3123319081325b11')

_srcname="linode-dynamic-dns-${pkgver}"

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
