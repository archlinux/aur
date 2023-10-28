# Maintainer: José Manuel Parrado Ortega <rexcibor@gmail.com>
_pkgbase='amt'
pkgname="${_pkgbase}ctrl-git"
pkgver=r62.343d19d
pkgdesc="INTEL AMT utility like wol"
url="https://github.com/sdague/amt/branches"
license=('Apache')
pkgrel=1
arch=('any')
depends=('python' 'python-six' 'python-appdirs' 'python-requests')
makedepends=('git')
source=('git+https://github.com/sdague/amt')
md5sums=(SKIP)

pkgver() {
        cd "$_pkgbase"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#makedepends=('python-setuptools')  # unless it only requires distutils

build() {
    cd "$srcdir/$_pkgbase"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgbase"
    python setup.py install --root="$pkgdir" --optimize=1
}

