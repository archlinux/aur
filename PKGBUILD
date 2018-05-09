# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('dnsdiag')
pkgver=1.6.4
pkgrel=1
pkgdesc='DNS Diagnostics and Performance Measurement Tools'
arch=('any')
url='https://dnsdiag.org/'
license=('BSD')
depends=('python' 'python-dnspython' 'python-cymruwhois')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/farrokhi/dnsdiag.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm0644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

