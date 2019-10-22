# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Hervé Cauwelier <herve/oursours/net>
gitname=guppy3
pkgname=python-${gitname}-git
pkgver=258.5bba757
pkgrel=1
pkgdesc="Python memory profiler and debugger"
arch=('any')
url="https://github.com/zhuyifei1999/${gitname}"
license=('GPL')
depends=(python{,-setuptools} git)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}
package() {
    cd "${srcdir}/${gitname}"
    python setup.py install --root="$pkgdir" --optimize=1
}
