pkgname=otf-sfmono
pkgver=20180608
pkgrel=1
pkgdesc='San Francisco Mono font from Apple'
arch=('any')
url='http://www.apple.com/safari/'
license=('custom')
depends=()
makedepends=('git')
source=("${pkgname}::git+https://github.com/ZulwiyozaPutra/SF-Mono-Font.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --format=%ci | cut -d " " -f 1 | sed s/-//g
}

package() {
	cd ${pkgname}
	install -d "${pkgdir}"/usr/share/fonts/OTF/
	install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF

	install -d "${pkgdir}"/usr/share/licenses/${pkgname}
	install -m644 README.md "${pkgdir}"/usr/share/licenses/${pkgname}/
}
