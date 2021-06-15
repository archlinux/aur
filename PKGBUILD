# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-secure-cookie-git"
pkgver=0.1.0.r88.gc959082
pkgrel=1
pkgdesc="Secure cookies and sessions for WSGI "
url="https://github.com/pallets/secure-cookie"
license=("BSD")
arch=("any")
provides=("python-secure-cookie")
depends=("python")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "secure-cookie"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "secure-cookie"
 python setup.py build
}

package(){
 cd "secure-cookie"
 python setup.py install --root="$pkgdir" --optimize=1
}
