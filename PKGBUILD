# Maintainer: Luna Stadler <lu@papill0n.org>

pkgname=healthy-git
pkgver=r30.8f71e7f
pkgrel=2
pkgdesc="A tiny Linux process monitor"
arch=('any')
url='https://github.com/heyLu/healthy'
license=('GPL3')
depends=('python-gobject' 'gtk3')
makedepends=('git')
source=("${pkgname}::git+https://github.com/heyLu/healthy")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


package() {
	cd "$srcdir/$pkgname"

	install -Dm 755 healthy.py      "${pkgdir}/usr/bin/healthy"
	install -Dm 644 healthy.desktop "${pkgdir}/usr/share/applications/healthy.desktop"
}
