validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-libguestfs
pkgver=1.38.0
pkgrel=2
pkgdesc="Python bindings for libguestfs"
arch=('any')
url="http://libguestfs.org/"
license=('LGPL3')
_pkgname=guestfs
makedepends=('python-setuptools' 'python2-setuptools' 'libguestfs')
source=("http://download.libguestfs.org/python/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('35aa80c6889fd11aeac364436e6dfe5199b5a9771937085a45c9cc1d6943559cd33fda7e28d62f54ba06e10b5f0f8e462dc94d35621c7da3bc82467f60d988cd'
            'SKIP')

package_python-libguestfs() {
  depends=('python' 'libguestfs')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
