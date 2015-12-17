pkgname=httpie-ntlm
pkgver=1.0.2
pkgrel=2
pkgdesc="NTLM auth plugin for HTTPie"
url="https://github.com/jkbrzt/httpie-ntlm"
depends=('httpie' 'python-requests-ntlm')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/h/httpie-ntlm/httpie-ntlm-$pkgver.tar.gz")
md5sums=('870b3411af8f846534518439bcbb3beb')

build() {
  cd httpie-ntlm-$pkgver
  python3 setup.py build
}

package() {
  cd httpie-ntlm-$pkgver
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/httpie-ntlm/LICENSE"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
