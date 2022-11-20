# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-cmd2
pkgver=2.4.2
pkgrel=1
pkgdesc="A tool for building interactive command line apps"
arch=('any')
url="https://github.com/python-cmd2/cmd2"
license=('MIT')
depends=('python38-attrs' 'python38-colorama' 'python38-pyperclip' 'python38-wcwidth')
makedepends=('python38-setuptools-scm')
checkdepends=('python38-pytest-cov' 'python38-pytest-mock' 'python38-pytest-runner' 'python38-pytest-xdist'
              'vi')
source=("https://pypi.io/packages/source/c/cmd2/cmd2-$pkgver.tar.gz")
sha512sums=('d70d264671db2783526c589199ff74cc70d53a4fbaa1d78636a508dbf8216aefab17f5764bf25b2b86e9c1413e0e61977819fbb0dec59d3209195df522d3fa5f')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd cmd2-$pkgver
  python3.8 setup.py build
}

check() {
  cd cmd2-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd cmd2-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
