# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Pochang Chen <johnchen902@gmail.com>

pkgname=python-nclib
_name=nclib
pkgver=1.0.0
pkgrel=1
pkgdesc="Netcat as a library: convienent socket interfaces"
license=('MIT')
arch=('any')
url="https://pypi.python.org/pypi/nclib"
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/rhelmot/nclib/release/stable/LICENSE")
sha512sums=('d97b67efdea1afae9f0979c2a43bbe84a3aca8de06147536f7be51573b05ff974af9646121dd2bd8d8426f1b514d0341a25a0ac2bb717c09d203b1eeb2bc1226'
            'caafbd65a0d0088eef0980ec3b72d7e6a001986d3dbd329a8c1c0ffe2ebcf212ce6be0cf7c19aff88389c9bc16022e4ec6f073cf79e24bcfd88bb126104e6af9')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
