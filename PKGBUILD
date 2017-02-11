# Contributor: Andrew Rabert <draje@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.1.1
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python-requests')
source=("git+https://github.com/nvllsvm/linode-dynamic-dns.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/linode-dynamic-dns
  python setup.py build
}

package() {
  cd "$srcdir"/linode-dynamic-dns
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
