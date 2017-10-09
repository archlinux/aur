# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-mdstat' 'python2-mdstat')
pkgver=1.0.4
pkgrel=2
pkgdesc="Convert your /proc/mdstat file into an object usable in Python"
arch=( 'i686' 'x86_64' )
url="https://github.com/truveris/py-mdstat/"
license=( 'CUSTOM' )
depends=( 'python' 'python2' 'mdadm' )
makedepends=( 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'mdadm' )
_pkgname=mdstat
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/m/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('a2894fd20e70f78aa1310792f4322524321d7151085e6caef8e089f05c40334bfff06162b2854b50f33111d0073c4a9378781c79127ff6345eda50d8f9ad3e69'
            'SKIP')

package_python-mdstat() {
  depends=('python' 'mdadm')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-mdstat() {
  depends=('python2' 'mdadm')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
