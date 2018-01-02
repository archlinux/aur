# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=py3status
pkgver=3.7
pkgrel=1
pkgdesc="An extensible i3status replacement/wrapper written in python"
url="http://www.ultrabug.fr/tag/py3status/"
arch=('any')
license=('custom: Simplified BSD')
depends=('python' 'python-setuptools')
optdepends=('i3status: for some of the functionality'
            'acpi: for some of the battery related modules')
source=($pkgname-$pkgver.tar.gz::"https://github.com/ultrabug/py3status/archive/$pkgver.tar.gz")
sha256sums=('ea0efd310a5211f52f8481b5e201ce0b5d6bb45d07c4805c988fd3020db054f8')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/* README.rst CHANGELOG "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
