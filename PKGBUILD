# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=organize
_name="$pkgname-tool"
pkgver=1.9
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
sha1sums=('24bb2f86822159a1c95054f21e29f7e429ec1b9f')
sha256sums=('7b2d80cf730f09e665a8403b9ec20bb5fb30cbdb3d04621fa2f49871cc15d777')

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
