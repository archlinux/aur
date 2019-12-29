# Maintainer: bigpod9 <bigpod9@gmail.com>
pkgname=dupliseek
pkgver=0.0.2
pkgrel=7
pkgdesc="Application to find all your duplicate images."
arch=('any')
url="https://gitlab.com/magnusmj/dupliseek.git"
license=('MIT')

depends=('python-pyqt5' 'python-numpy' 'python-imutils')

install=dupliseek.install
source=(dupliseek.0.0.2.tar.xz::https://www.dropbox.com/s/0nf8r96lr20wnvj/dupliseek0.0.2.tar.xz?dl=1)
md5sums=('c0ff1a839dc47437d30b0e2e42ce225b')


package() {
    cd "$srcdir"/dupliseek
	mkdir -p "$pkgdir"/opt/dupliseek
	cp -r * "$pkgdir"/opt/dupliseek/
	mkdir -p "$pkgdir"/usr/share/applications
	cp dupliseek.desktop "$pkgdir"/usr/share/applications/

	cd "$pkgdir"/opt/dupliseek/
	rm install_arch.sh
	rm install_fedora.sh
	rm install_ubuntu.sh
	rm -r snap-stuff

	mkdir "$pkgdir/usr/bin/"

	echo "/opt/dupliseek/main.py" >  "$pkgdir/usr/bin/dupliseek"
}
