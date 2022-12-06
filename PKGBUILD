# Maintainer: Aleksei <itsveter@gmail.com>
pkgname=godot-build
pkgver=0.1.2
pkgrel=2
pkgdesc="Build Tool for Godot"
url="https://codeberg.org/Denotatum/gdbuild"
license=("GPLv3")
arch=("any")
depends=("python>=3.6")
makedepends=("python-setuptools")
_pkgtag="$pkgname-$pkgver"
_pkgtar="$_pkgtag.tar.gz"
source=("$_pkgtar::$url/archive/$pkgver.tar.gz")
replaces=($pkgname)
conflicts=($pkgname)
noextract=("$_pkgtar")
md5sums=('0aec2273a64c7ebae29d181b6220521a')

prepare() {
  mkdir -p "$_pkgtag"
  tar xf "$_pkgtar" -C "$_pkgtag" --strip-components 1
}

package() {
  cd "$_pkgtag"
  python setup.py install --root "${pkgdir}"
}
 
