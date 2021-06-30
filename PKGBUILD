# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-ezlinks-plugin"
pkgver=0.1.11
pkgrel=1
pkgdesc="MkDocs plugin to automagically generate relative links between markdown pages"
url="https://github.com/orbikm/mkdocs-ezlinks-plugin"
license=("MIT")
arch=("any")
provides=("mkdocs-ezlinks-plugin")
conflicts=("python-mkdocs-ezlinks-plugin")
replaces=("python-mkdocs-ezlinks-plugin")
depends=("mkdocs" "python-pygtrie-git")
makedepends=("python-setuptools" "git")
source=("$url/releases/download/v_$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("fb89c71aed642bba221ad7f8e6cc27a1812c0865ed27f43c667c6133254eca02")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
