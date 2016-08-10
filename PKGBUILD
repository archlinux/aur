# Maintainer: rains31@gmail.com

pkgname=python-gattlib
pkgver=0.20150805
pkgrel=2
pkgdesc='This is a Python library to use the GATT Protocol for Bluetooth LE devices. It is a wrapper around the implementation used by gatttool in bluez package. It does not call other binaries to do its job :)'
arch=(any)
url="https://bitbucket.org/OscarAcena/pygattlib"
license=('Apache')
depends=('python' 'boost' 'bluez-libs')
source=(
    "https://pypi.python.org/packages/be/2f/5b1aecec551b42b59d8b399ad444b5672972efb590ca83d784dbe616a3e1/gattlib-0.20150805.tar.gz#md5=f620eca190bb7acd67c7aafecaedb6c2"
    "gattlib.patch"
)
md5sums=(
    "f620eca190bb7acd67c7aafecaedb6c2"
    "e18b425b78862d42d4896ea1f4b54252"
)


build() {
  cd "${srcdir}/gattlib-${pkgver}"
  patch -p1 -i ../gattlib.patch
}

package() {
  cd "${srcdir}/gattlib-${pkgver}"
  python3 setup.py install --root "$pkgdir"
  chmod +rx -R "$pkgdir"
}
