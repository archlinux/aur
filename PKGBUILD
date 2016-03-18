# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname='sslyze'
pkgver=0.13.5
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url='https://github.com/nabla-c0d3/sslyze'
license=('GPL2')
depends=('python2' 'python2-pip')
source=("https://github.com/nabla-c0d3/sslyze/archive/${pkgver}.tar.gz")
sha1sums=('410b50bfaf66a75d810628e9afa1a3d619e73645')

package() {
	# Install files in /opt
	mkdir -p "$pkgdir/opt/sslyze"
	cp -a $srcdir/${pkgname}-${pkgver}/. $pkgdir/opt/sslyze
	pip2 install -r $pkgdir/opt/sslyze/requirements.txt --target $pkgdir/opt/sslyze/lib

	# Create cli launcher symlink in /usr/bin
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/sslyze/sslyze_cli.py "$pkgdir/usr/bin/sslyze"
	chmod 755 "$pkgdir/opt/sslyze/sslyze_cli.py"

}
