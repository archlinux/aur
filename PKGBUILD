# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=sftpman-gtk
pkgver=1.2.0
pkgrel=1
pkgdesc="GTK frontend for SftpMan (application that handles sshfs/sftp file systems mounting)."
arch=('any')
url="https://github.com/spantaleev/sftpman-gtk"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'sftpman>=0.5.0' 'python-setuptools')
makedepends=('git')
optdepends=("openssh-askpass: allows you to enter passwords during mounting [install requires session restart]")
install=$pkgname.install
source=('git+https://github.com/spantaleev/sftpman-gtk.git#tag='$pkgver)
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

	install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm 644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
