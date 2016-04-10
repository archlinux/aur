# Maintainer: Eisfreak7 <eisfreak7@gmail.com>
# modified version of the khard-git package by David Runge <dave@sleepmap.de>

pkgname=khard
pkgver=0.9.0
pkgrel=1
pkgdesc="Console CardDAV client"
license=("GPL3")
url="https://github.com/scheibler/khard"
depends=('python2-configobj' 'python2-vobject' 'python2-atomicwrites' 'python2-yaml')
makedepends=('python2-setuptools')
optdepends=('vdirsyncer: Synchronization of address books with a DAV server.'
            'python2-caldavclientlibrary-svn: Create and remove address books on the DAV server using davcontroller utility.')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('b277341c69cb16293c240571a7d20cde')
install="${pkgname}.install"
provides=('khard' 'davcontroller')
conflicts=('khard')
arch=('any')
options=(!emptydirs)

build() {
	cd "$srcdir/$pkgname-$pkgver"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root=$pkgdir
	install -Dm 644 misc/khard/khard.conf.example "${pkgdir}/usr/share/doc/khard/khard.conf.example"
	install -Dm 644 misc/zsh/_khard "${pkgdir}/usr/share/zsh/site-functions/_khard"
	install -Dm 644 AUTHORS "${pkgdir}/usr/share/doc/khard/AUTHORS"
	install -Dm 644 CHANGES "${pkgdir}/usr/share/doc/khard/CHANGES"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/khard/README.md"
}
