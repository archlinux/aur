# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=oilshell
pkgver=0.4.0
pkgrel=1
pkgdesc="Oil is a new unix shell"
arch=('x86_64')
url="http://www.oilshell.org/"
optdepends=('readline: for interactive features')
license=('APACHE')
options=(!strip)
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
md5sums=('576fbf53bbb00a85ae42041a073df1eb')

build() {
	cd "oil-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "oil-$pkgver"

    # make install is faked...
    install -Dm755 _bin/oil.ovm "$pkgdir/usr/bin/oil.ovm"
    ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/osh"
}
