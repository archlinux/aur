# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=organize
_name="$pkgname-tool"
pkgver=1.8.1
pkgrel=1
pkgdesc='A command line utility to automate file organization tasks'
arch=('any')
url='https://github.com/tfeldmann/organize'
license=('MIT')
depends=('python'
         'python-appdirs'
         'python-colorama'
         'python-docopt'
         'python-exifread'
         'python-pendulum'
         'python-pyaml'
         'python-send2trash'
         'python-textract')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha1sums=('0c5655d03cce1031c6e20a897690454b4213869a')
sha256sums=('52a0d77ec581eac943a340691570c4d3f1993653a609955c2aa062045d6ebd71')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
