# Maintainer: A Farzat <a@farzat.xyz>
pkgname=python-anchor-kr-git
pkgver=6.4cedb6a
pkgrel=1
pkgdesc="This project is created in the favor of scraping projects of KR."
arch=('any')
url="https://github.com/justfoolingaround/anchor"
license=('custom')
depends=('python')
makedepends=('git')
_gitname='anchor'
source=("git+https://github.com/justfoolingaround/$_gitname")
md5sums=(SKIP)
provides=(python-anchor-kr)


pkgver() {
  cd "${_gitname}"
  echo "$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  python setup.py build
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
