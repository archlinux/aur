# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.5.0
pkgrel=2
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs>=1.3.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz"
        "$pkgname-fix-configfile-location.diff::https://github.com/kedder/ofxstatement/commit/f340759a8515aa7a73e6571197b2adb99fa393d4.diff")
md5sums=('22dea873452c028a9804b022af0f4fbd'
         '63b71ca3220381f6e2b69dbbeb69b622')
sha256sums=('1c278bb7686adb8696d0758ee182f7fadb7bed4628ccc0ed77dafca55ad94289'
            '3785ca11e57ac06602f30684512d57e1b3db6791cf61e4ce2739d206030ce1c0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
