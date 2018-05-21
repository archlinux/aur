# Maintainer: Ainola

pkgname=python2-google-auth-httplib2-git
pkgver=r8.e7cd722
pkgrel=1
pkgdesc="An httplib2 transport for google-auth"
arch=('any')
url="https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2"
license=('Apache')
makedepends=('python2-setuptools')
depends=('python2' 'python2-google-auth' 'python2-httplib2' 'python2-six')
source=("git+https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/google-auth-library-python-httplib2"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/google-auth-library-python-httplib2"
    python2 setup.py build
}

package() {
    cd "$srcdir/google-auth-library-python-httplib2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
