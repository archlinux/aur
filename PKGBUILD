# Maintainer: Vinamra Jain <vinamraj01@gmail.com>

pkgname=wand
_name=wand-cli
pkgver=2.4.9
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
sha256sums=('04a4e6b47c1d627aefef8019812640cb23039021b29db4e26aa8e6013739a562')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --user --skip-build --root="$pkgdir" --optimize=1
}
