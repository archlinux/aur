# Maintainer: goll <adrian.goll+aur[at]gmail>
# Maintauber: Michael Lass <bevan@bi-co.net>

pkgname=sslyze
pkgver=2.0.1
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('AGPL3')
depends=('python')
makedepends=('python-pip')
options=('!strip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz"
        "sslyze")
sha256sums=('8e9483250fc7da491ba7a4adb56c31d8620ef7401de84cca17f6260fc14e0369'
            '8d2ffc47d608ce439b683500c9dde94b953535b499ef72dfcd548f45faa71fb2')

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/${pkgname}-${pkgver}/. $pkgdir/opt/sslyze
	pip install $pkgdir/opt/sslyze --target $pkgdir/opt/sslyze/lib

	# Create an indirect launcher in /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	install -Dm 755 "$srcdir/sslyze" "$pkgdir/usr/bin/sslyze"
}
