# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname='gourmand'
pkgver=1.0.0
pkgrel=1
pkgdesc="A recipe manager for desktop with the possibilities to import, organize, and tweak recipes"
arch=('any')
url="https://github.com/GourmandRecipeManager/gourmand"
license=('GPL')
depends=('python-gobject' 'gtk3' 'python-pyenchant' 'gst-python' 'python-pillow' 'python-sqlalchemy')
makedepends=('python-pip')
checkdepends=()
optdepends=('python-beautifulsoup4: Webpage import plugin')
conflicts=('gourmet')
source=("$pkgname-$pkgver-py3-none-any.whl::$url/releases/download/$pkgver/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('9f1acf7098e62a8bca932ba43a9f1ee6b94978073824b96c5c1032fce23b12d4')

package() {
  # https://wiki.archlinux.org/title/Python_package_guidelines#pip
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
# vim:set ts=2 sw=2 et:
