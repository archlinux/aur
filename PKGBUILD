# Maintainer: Xyne <ca archlinux xyne, backwards>
_pkgname=pyzotero
pkgname="$_pkgname-git"
pkgver=v1.5.18.r1.gc208d4f
pkgrel=1
pkgdesc="A Python wrapper for the Zotero API"
arch=('any')
url="https://github.com/urschrei/$_pkgname"
license=('GPL')
depends=('python3')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm' 'python-toml')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+https://github.com/urschrei/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd -- "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd -- "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd -- "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
