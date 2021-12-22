# Contributor: Eric Fung <loseurmarbles [at] gmail [dot] com>
# Contributor: Alireza Ayinmehr <alireza dot darksun at gmail dot com>
# Contributor: Daniel Ruiz de Alegria <daniruizdealegria at gmail dot com>

pkgname=flat-remix-git
pkgver=20211214.r0.g5711425af
pkgrel=1
pkgdesc='An icon theme inspired by material design.'
arch=('any')
options=('!strip')
url='https://drasite.com/flat-remix'
license=('GPL3')
makedepends=('git' 'gtk-update-icon-cache')
provides=('flat-remix')
conflicts=('flat-remix')
install=$pkgname.install
source=("${pkgname}::git+https://github.com/daniruiz/flat-remix.git")
sha256sums=('SKIP')

pkgver () {
	cd "${srcdir}/${pkgname}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgname}"
        DESTDIR="${pkgdir}" make install
}
