# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: CJlano <cjlano+AUR.basiciw@free.fr>

pkgname=python-basiciw
_gitname=basiciw
pkgver=0.2.2
pkgrel=1
pkgdesc="Retrieve information such as ESSID or signal quality from wireless cards (Python module)"
arch=('i686' 'x86_64')
url="https://github.com/enkore/basiciw/"
license=('MIT')
depends=('python' 'wireless_tools')
makedepends=('git')
conflicts=basiciw-git
provides=basiciw-git
replaces=basiciw-git
source=("https://pypi.python.org/packages/source/b/basiciw/basiciw-$pkgver.tar.gz")
md5sums=('bf4197a549c57c19c33a9a67d7da2eb4')

package() {
  cd "$srcdir"/$_gitname-$pkgver
  python setup.py install --root "$pkgdir"

  # Install README file
  install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
}
