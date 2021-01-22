# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et:

pkgname=journalwatch
pkgver=1.1.0
pkgrel=4
pkgdesc="Filter error messages from systemd journal, similar to logcheck/logwatch."
arch=(any)
url="https://pypi.python.org/pypi/journalwatch/"
license=('GPL')
depends=('python' 'python-systemd')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c06619d5ece24510d6ec334febfbdef9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
