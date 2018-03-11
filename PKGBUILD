# Contributor: Andrew Rabert <draje@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.2.1
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python>=3.6' 'python-requests')
source=("https://github.com/nvllsvm/linode-dynamic-dns/archive/${pkgver}.tar.gz")
sha256sums=('21cb39fdcac03e0d6b550a471e80d8c47560424f2e510cee9a1ff903b1c0dfe1')

_srcname="linode-dynamic-dns-${pkgver}"

build() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py build
}

package() {
  cd "${srcdir}"/"${_srcname}"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
