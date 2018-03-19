# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=ccv-samples
pkgver=0.7.r1447
pkgrel=1
pkgdesc='Samples included in the CCV Library repository'
arch=('i686' 'x86_64')
url='http://libccv.org/'
license=('BSD3')
makedepends=('subversion')
source=('svn+https://github.com/liuliu/ccv/trunk/samples'
        'https://raw.githubusercontent.com/liuliu/ccv/stable/COPYING')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd $srcdir/samples
	echo 0.7.r`svn info | head -7 | tail -1 | cut -d' ' -f2`
}

package() {
	install -D -m644 COPYING $pkgdir/usr/share/licenses/ccv/COPYING.samples
	mkdir -p $pkgdir/usr/share/ccv
	cp -r samples $pkgdir/usr/share/ccv/samples
}

