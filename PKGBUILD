# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=organize
_name="$pkgname-tool"
pkgver=1.10.1
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
         'python-simplematch')
optdepends=('python-textract: extract text from any document')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha1sums=('2eaeba31fc268262cb882b35672121d1ec3c00d1')
sha256sums=('c11dd3af2c03132226c218ad661176ef329575bfd324ad7576cd9ab23593cce5')

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
