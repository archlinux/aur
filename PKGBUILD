# Maintainer: Daniel Maslowski <info@orangecms.org>

_commit=1e22f740cac329dd61663cba12e181142f1c94de
pkgname=psptool
pkgver=2.2
pkgrel=1
pkgdesc="Swiss Army knife for dealing with firmware of the AMD Secure Processor"
arch=('any')
url="https://github.com/PSPReverse/PSPTool"
license=('GPL3')
depends=(
  'ipython'
  'python'
  'python-cryptography'
  'python-prettytable'
  'python-setuptools'
)
provides=("$pkgname")
conflicts=("${pkgname}-git")
options=(!emptydirs)
source=(https://github.com/PSPReverse/$pkgname/archive/$_commit.tar.gz)
sha512sums=('09c5264ba2a9fc16cba5568be2b2b8161e5234f0473629785b928d34f16e9611e83816378c04c337d812bd74d78c7c682590f7c4ffe8bb58f8aed3779b04a0e9')

package() {
  cd "PSPTool-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
