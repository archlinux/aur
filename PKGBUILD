# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

pkgname=python-pykeepass-git
_gitname=pykeepass
pkgver=3.2.1.r36.gfa6f608
pkgrel=1
pkgdesc="Low-level library to interact with keepass databases"
arch=("any")
license=("GPL3")
url="https://github.com/libkeepass/pykeepass"
depends=("python" "python-pycryptodome" "python-lxml" "python-dateutil" "python-construct" "python-cffi" "python-argon2_cffi" "python-markupsafe" "python-pycparser")
makedepends=("python-setuptools")
provides=(python-pykeepass)
conflicts=(python-pykeepass)
source=("git+https://github.com/libkeepass/pykeepass.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        cd "${srcdir}/${_gitname}/"
}

package() {
        cd "${srcdir}/${_gitname}/"
        python setup.py install --root="${pkgdir}/" --optimize=1
        install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}

