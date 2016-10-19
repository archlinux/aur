# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=mailcap-fix
_pkgname=mailcap_fix
pkgver=0.2.0
pkgrel=0
pkgdesc="A patched mailcap module that conforms to RFC 1524"
arch=('any')
url="https://github.com/michael-lazar/mailcap_fix"
license=('UNLICENSE')
conflicts=('mailcap-fix-git')
makedepends=('git' 'python-setuptools')
depends=('python')
source=(https://github.com/michael-lazar/mailcap_fix/archive/v$pkgver.tar.gz)
md5sums=('c7954bfc03e3c7c33778d61427cc3612')


package() {
   cd "$srcdir/$_pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/
}
