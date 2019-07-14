# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_plan
_name=trytond_project_plan
pkgver=5.2.1
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add planning capabilities on projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02b93aa1f869de3f17d861b4e942b100ecfb16cc3567b4856e4d76ecd052ebad')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
