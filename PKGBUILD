# Contributor: Andrew Rabert <ar@nullsum.net>

pkgbase=linode-dynamic-dns
pkgname='linode-dynamic-dns'
pkgver=0.7.0
_srcname="linode_dynamic_dns"
pkgrel=1
pkgdesc="Update Linode DNS records to point to local IPv4 and IPv6 addresses."
arch=('any')
url="https://github.com/nvllsvm/linode-dynamic-dns"
depends=('python>=3.6' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_srcname:0:1}/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('9348732573146142c581b91def76f8e6404d658b431042dbb8d426db40f5fd8f')

build() {
    cd ${_srcname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_srcname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
