pkgname=isz-tool-git
pkgdesc='A command line utility to manipulate ISZ files (.isz)'
pkgver=git
pkgrel=1
arch=('any')
url='https://github.com/oserres/isz-tool'
license=('GPL3')
depends=('python')
makedepends=('git')
source=('git+https://github.com/oserres/isz-tool.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
	install -pm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
	install -pDm755 isz-tool.py "${pkgdir}/usr/bin/isz-tool"
}
