# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Frank J. T. Wojcik <fwojcik@uw.edu>
# Contributor: Reini Urban <rurban@cpan.org>
# Contributor: Austin Appleby <aappleby@google.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=SMHasher3
pkgname=smhasher3
_pkgver=beta2
pkgver=0.0.0${_pkgver}
pkgrel=1
pkgdesc="A tool for testing the quality of hash functions in terms of their distribution, collision, and performance properties"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/fwojcik/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake')
optdepends=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
b2sums=('a6f5a0e82aa066709795182874ee90f3f278c49b06994e11e6b86784d144ca1685654737ee6dea4eda3702a64f8fb21efa02a11d4a6740234988d1a31457654a')

build() {
	cd "${pkgname}-${_pkgver}"
	cmake -B build --install-prefix=/usr
	cmake --build build
}

package() {
	cd "${pkgname}-${_pkgver}"
	install -D --target-directory="${pkgdir}/usr/bin" build/SMHasher3
}
