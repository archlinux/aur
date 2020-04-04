# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=organize
_name="$pkgname-tool"
pkgver=1.8.2
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
sha1sums=('5e4b234a3521c86d7c4b13853aa9978e90323cc0')
sha256sums=('ef519ae634f96d0703ce551fbad145936e08b3ef0880b650095499a487197daf')

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
