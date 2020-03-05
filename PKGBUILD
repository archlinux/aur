# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=python-textract
_name=textract
pkgver=1.6.3
pkgrel=1
pkgdesc="Extract text from any document. No muss. No fuss."
arch=('any')
url="https://github.com/deanmalmgren/textract"
license=('MIT')
depends=('python'
         'python-argcomplete')
makedepends=('python-setuptools')
# https://textract.readthedocs.io/en/stable/
# https://github.com/deanmalmgren/textract/blob/master/requirements/python
optdepends=('antiword: .doc support'
            'docx2txt: .docx support'
            'python-beautifulsoup4: .html and .htm support'
            'python-xlrd: .xls and .xlsx support'
            'unrtf: .rtf support'
            'python-pptx: .pptx support'
            'python-pdfminer: .pdf support')
source=(https://files.pythonhosted.org/packages/6e/39/b62302c738d872ca9cfb39ebc03b6b565c562289e0941d7379b61d2f147a/$_name-$pkgver.tar.gz)
sha1sums=('5ea5b7b5c5b029ed1d8d95c29f92b79cff6b4ca8')
sha256sums=('6213b2f923b85af8e5e380241db9361e3f5dbd444a74108745fd4121ae151310')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
