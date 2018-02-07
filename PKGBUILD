# Maintainer: Karol Babioch <karol@babioch.de>

pkgname='(dnsdiag-git')
_gitname='dnsdiag'
pkgver=1.6.3
pkgrel=1
pkgdesc='DNS Diagnostics and Performance Measurement Tools'
arch=('any')
url='https://dnsdiag.org/'
license=('BSD')
depends=('python' 'python-dnspython' 'python-cymruwhois')
makedepends=('git' 'python-setuptools')
source=("$_gitname::git+https://github.com/farrokhi/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/otca"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm0644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

