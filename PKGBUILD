# Maintainer: Amirul Fitri <tounghacker@gmail.com>

_pkgname=span
pkgname=${_pkgname}-git
pkgver=20220321
pkgrel=1
pkgdesc="Implementation of C++20's std::span for older compilers"
arch=('any')
url="https://github.com/tcbrindle/span"
license=('custom')
makedepends=('git')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/tcbrindle/span.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git log -1 --date=format:%Y%m%d --pretty=%cd
}

package() {
	cd "${_pkgname}"
	install -dm755 "${pkgdir}"/usr/include/tcb/
	install -Dm644 include/tcb/span.hpp "${pkgdir}"/usr/include/tcb/span.hpp
	install -Dm644 LICENSE_1_0.txt "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
}
