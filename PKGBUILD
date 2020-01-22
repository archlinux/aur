# Maintainer: Aleksandr Mezin <mezin.alexander@gmail.com>

pkgname=python-nox
pkgver=2019.11.9
pkgrel=1
pkgdesc='Flexible test automation for Python'
arch=('any')
url='https://nox.thea.codes'
license=('Apache')
depends=('python-argcomplete' 'python-colorlog' 'python-py' 'python-virtualenv')
optdepends=('python-tox: tox-to-nox' 'python-jinja: tox-to-nox')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/n/nox/nox-$pkgver.tar.gz")
sha512sums=('77f36a6f6684ff1b4f66efab58bbadf0ecab0330e54b46135c7fb2f1325c7e8219d2d5d7f855d6c3c6d5edf89b6f920245f29f77fcd468058461b585434a693d')

build() {
  cd "$srcdir"/nox-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/nox-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
