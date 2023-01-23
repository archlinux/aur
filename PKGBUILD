# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ofxstatement-intesasp-git"
pkgver=r26.92111f1
pkgrel=1
pkgdesc="This plugin parses the Intesa San paolo xlsx statement file"
url="https://github.com/Jacotsu/ofxstatement-intesasp"
license=("BSD-3")
arch=("any")
depends=("ofxstatement"
         "python-openpyxl"
         "python-dataclasses")
makedepends=("python-build" "python-installer" "python-wheel" "git")
source=("git+$url")
sha256sums=('SKIP')
options=("!strip")

pkgver(){
 cd "ofxstatement-intesasp"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "ofxstatement-intesasp"
 python -m build --wheel --no-isolation
}

package(){
 cd "ofxstatement-intesasp"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
