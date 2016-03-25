pkgname=onedrive-sdk-python-git
pkgver=1.0.4.r33.a649bec
pkgrel=1
pkgdesc='Official Python OneDrive SDK for interfacing with OneDrive APIs (git)'
arch=('any')
url='https://github.com/OneDrive/onedrive-sdk-python/'
license=('MIT')
depends=('python' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/OneDrive/onedrive-sdk-python.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.r%s.%s" "$(cat src/onedrivesdk/version.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="${pkgdir}/"
}
