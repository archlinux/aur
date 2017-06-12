# Maintainer: 910JQK <v910JQK@gmail.com>
_pkgname=zhcal
pkgname=$_pkgname-git
pkgver=r7.97f8af8
pkgrel=1
pkgdesc='A Chinese calendar toolkit which supports four pillars (Sizhu) lookup.'
arch=('any')
url='https://github.com/910JQK/zhcal'
depends=('python')
provides=('zhcal')
source=('zhcal::git+https://github.com/910JQK/zhcal.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 zhcal.py "${pkgdir}/usr/bin/zhcal"
}
