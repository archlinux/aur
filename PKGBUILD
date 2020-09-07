# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-material-extensions-git"
pkgver=1.0.r5.g8e530fe
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
provides=("python-materialx")
makedepends=("python-setuptools")
source=("git+$url")
md5sums=("SKIP")

pkgver(){
 cd "mkdocs-material-extensions"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package(){
 cd "mkdocs-material-extensions"
 python setup.py install --root="$pkgdir"
 install -D -m 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
