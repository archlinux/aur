# Maintainer: Ainola
# Contributor: Felix Yan <felixonmars@archlinux.org> (Stable Package)

pkgname=python-google-auth-httplib2-git
pkgver=r8.e7cd722
pkgrel=4
pkgdesc="Google Authentication Library: httplib2 transport"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2"
license=('Apache')
arch=('any')
depends=('python-google-auth' 'python-httplib2' 'python-six')
provides=('python-google-auth-httplib2')
conflicts=('python-google-auth-httplib2')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest-runner' 'python-mock' 'python-flask' 'python-pytest-localserver')
source=("git+https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2.git")
sha512sums=('SKIP')

pkgver() {
    cd google-auth-library-python-httplib2
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd google-auth-library-python-httplib2
    python setup.py build
}

check() {
    cd google-auth-library-python-httplib2
    python setup.py pytest
}

package_python-google-auth-httplib2-git() {
    cd google-auth-library-python-httplib2
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
