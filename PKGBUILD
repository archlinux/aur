# Maintainer: Ashwini Sahu <ashwinisahu990@gmail.com>

pkgname=template
pkgver=r5.1e9b22a
pkgrel=1
pkgdesc="A script to genrate template files."
arch=('any')
url="https://github.com/ASHWIN990/${pkgname}"
license=('GPL3')
depends=('python3')
makedepends=('git')
provides=('template')
source=("git+https://github.com/ASHWIN990/template.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
    install -Dm775 template.py      -T ${pkgdir}/usr/bin/template
    install -Dm644 template_maker/* -t ${pkgdir}/usr/share/template_maker
}
