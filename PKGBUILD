# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ofxstatement-intesasp-git"
pkgver=r50.57a9f09
pkgrel=1
pkgdesc="This plugin parses the Intesa Sanpaolo xlsx statement file"
url="https://github.com/Jacotsu/ofxstatement-intesasp"
license=("BSD-3")
arch=("any")
depends=("ofxstatement"
         "python-openpyxl")
makedepends=("git" "python-build" "python-installer" "python-wheel" "python-setuptools")
source=("git+$url")
b2sums=("SKIP")
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
