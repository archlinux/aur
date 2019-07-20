# Maintainer: liara (liara at archlinux.email)

pkgname=python-shodan
pkgver=1.14.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/22/93/22500512fd9d1799361505a1537a659dbcdd5002192980ad492dc5262717/shodan-${pkgver}.tar.gz)
sha256sums=('13953527d0a1a86d2346631143066533a6f804551a77e40284d1dc53ce28bd30')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
