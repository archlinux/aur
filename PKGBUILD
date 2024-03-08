# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

_gitname=pykeepass_cache
pkgbase="python-${_gitname}"
pkgname="python-${_gitname}-git"
pkgver=2.0.3
pkgrel=1
pkgdesc="PyKeePass database caching in a background process. "
arch=("any")
license=("GPL3")
url="https://github.com/libkeepass/pykeepass_cache"
depends=("python-pykeepass" "python-daemon" "python-rpyc")
makedepends=("git" "python-setuptools")
provides=(python-pykeepass_cache)
source=("git+https://github.com/libkeepass/pykeepass_cache.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "${srcdir}/${_gitname}/"
}

package() {
        cd "${srcdir}/${_gitname}/"
        python setup.py install --root="${pkgdir}/" --optimize=1
}
