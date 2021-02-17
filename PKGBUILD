# Maintainer: Vinamra Jain <vinamraj01@gmail.com>

pkgname=wand
_name=wand-cli
pkgver=2.4.8
pkgrel=1
pkgdesc="Command line tool for compiling over 27 languages instantly using the wandbox api"
arch=('any')
depends=('python-pygments'
         'python-requests'
         'python-prompt_toolkit'
         'python-rich'
         'python-argparse')
makedepends=('python-setuptools')
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/w/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9161d3503ff6015c7ad49fcde14b42163d35f7766462b519e7f0de3981b4db0b')

build() {
  cd "$_name-$pkgver"
  python -m setuptools.launch setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --user --skip-build --root="$pkgdir" --optimize=1
}
