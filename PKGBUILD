# Maintainer: goll <adrian.goll+aur[at]gmail>
# Maintainer: Michael Lass <bevan@bi-co.net>

pkgname=sslyze
pkgver=2.0.6
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
sha256sums=('7b16da8c7c29be4454172d0d89f8caf2ad5003dbd6fd83d39b8df946a19c3447'
            '8d2ffc47d608ce439b683500c9dde94b953535b499ef72dfcd548f45faa71fb2')

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/${pkgname}-${pkgver}/. $pkgdir/opt/sslyze
	/usr/bin/pip install $pkgdir/opt/sslyze --target $pkgdir/opt/sslyze/lib

	# Create an indirect launcher in /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	install -Dm 755 "$srcdir/sslyze" "$pkgdir/usr/bin/sslyze"
}
