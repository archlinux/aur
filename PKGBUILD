# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-secure-cookie-git"
pkgver=0.2.0.r28.ge06d58d
pkgrel=1
pkgdesc="Secure cookies and sessions for WSGI "
url="https://github.com/pallets/secure-cookie"
license=("BSD")
arch=("any")
provides=("python-secure-cookie")
depends=("python" "python-werkzeug")
makedepends=("python-setuptools" "python-build" "python-wheel" "python-installer" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "secure-cookie"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "secure-cookie"
 python -m build --wheel --no-isolation
}

package(){
 cd "secure-cookie"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
