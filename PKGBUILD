# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgname='crowdin-cli-py'
pkgver=0.95.6
pkgrel=1
pkgdesc="python based crowdin command line tool"
arch=('any')
url="https://github.com/PaulGregor/crowdin-cli"
license=('MIT')
depends=('python' 'python-pyaml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.zip")
sha512sums=('876455971bd22a8e94bbd92a467a59796bc23b086520666ec1a639acd29f12fd195d2b95c1eb9aa1ad80ac671033d1448c4d8bd1b42a9bb9c990cccd7c42c558')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  python setup.py build
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
