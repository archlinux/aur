# Maintainer: Chris Simons < chris at simonsmail dot net >

pkgname=("protonfixes")
pkgver="1.0.9"
pkgrel="1"
pkgdesc="A module for applying fixes at runtime to unsupported games with Steam Proton without changing game installation files"
arch=("any")
url="https://github.com/simons-public/protonfixes"
license=("BSD")
makedepends=("python-setuptools")
optdepends=('wine: win32 proton prefix support'
            'winetricks: winetricks support'
            'cefpython3: splash dialog support')
source=("https://github.com/simons-public/protonfixes/archive/$pkgver.tar.gz")
md5sums=('acb0587a3b22f405ec317a1816ab0f9b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
