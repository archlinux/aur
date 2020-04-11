# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-sjcl
_name="sjcl"
pkgver=0.2.1
pkgrel=1
pkgdesc="Decrypt and encrypt messages compatible to the Stanford Javascript Crypto Library (SJCL) message format"
arch=('any')
url="https://github.com/berlincode/sjcl"
license=('BSD')
depends=('python'
         'python-pycryptodome')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha1sums=('f6dd461a649d2631730a6ddf223394490d9543c8')
sha256sums=('3761ba01f9f049eaa2f67516054b7bfb2e27fe8bc7c9c630da7168fba58f0c57')


build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
