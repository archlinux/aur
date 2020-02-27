# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('ex-impression-icon-theme')
pkgver=1.1
pkgrel=4
pkgdesc='This icon theme got inspired on Mac OS icons and mimics those for the Linux OS'
arch=('any')
url='https://github.com/balasakthi88/EX-Impression'
license=('GPL3')
makedepends=('git')
source=("git+${url}")
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/EX-Impression"
  rm *.md
  rm LICENSE
  rm -rf "theme extras"
  rm -rf .git
}

package() {
	msg2 'Installing icons ...'
	cd "${srcdir}"
	install -dm 755 "${pkgdir}/usr/share/icons/"
	cp -drf --no-preserve='ownership' . "${pkgdir}/usr/share/icons/"
}
# vim:set ts=2 sw=2 et: