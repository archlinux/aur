# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=pbincli
_name="PBinCLI"
pkgver=0.3.1
pkgrel=1
pkgdesc='A command line client for PrivateBin'
arch=('any')
url='https://github.com/r4sas/PBinCLI'
license=('MIT')
depends=('python'
         'python-base58'
         'python-pycryptodome'
         'python-requests'
         'python-sjcl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha1sums=('b06e1e7130143eee98a69a3e210c3b4f58b528b5')
sha256sums=('a7db80ef1c842f73db04996602db32085e65a9026115cf534b08a650d2f05dc5')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
