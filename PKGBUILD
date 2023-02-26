# Maintainer: Luna Stadler <lu@papill0n.org>

pkgname=healthy-git
pkgver=r54.d17ae92
pkgrel=1
pkgdesc="A tiny Linux process monitor"
arch=('any')
url='https://github.com/heyLu/healthy'
license=('GPL3')
depends=('python-gobject' 'gtk3' 'python-cairo')
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
