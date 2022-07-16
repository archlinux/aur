# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Hervé Cauwelier <herve/oursours/net>
gitname=guppy3
pkgname=python-${gitname}-git
pkgver=3.1.2.8.g4cb9fcb
pkgrel=1
epoch=1
pkgdesc="Python memory profiler and debugger"
arch=('any')
url="https://github.com/zhuyifei1999/${gitname}"
license=('GPL')
depends=(python{,-setuptools} git)
provides=("python-${gitname}=${pkgver}")
conflicts=("python-${gitname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git describe --long --tags)"
    ver=${ver##v}
    printf "%s" "${ver//-/.}"
}
package() {
    cd "${srcdir}/${gitname}"
    python setup.py install --root="$pkgdir" --optimize=1
}
