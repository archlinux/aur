# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=sftpman-gtk
pkgver=0.4.2
pkgrel=1
pkgdesc="GTK frontend for SftpMan (application that handles sshfs/sftp file systems mounting)."
arch=('any')
url="https://github.com/spantaleev/sftpman-gtk"
license=('BSD')
depends=('gtk3' 'python-gobject' 'sftpman>=0.5.0' 'python-setuptools')
makedepends=('git')
optdepends=("openssh-askpass: allows you to enter passwords during mounting [install requires session restart]")
install=$pkgname.install
source=('vcs-repository::git://github.com/spantaleev/sftpman-gtk.git#tag='$pkgver)
md5sums=('SKIP')

package() {
	cd "$srcdir/vcs-repository"
	python setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

	install -Dm 644 $srcdir/vcs-repository/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm 644 $srcdir/vcs-repository/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm 644 $srcdir/vcs-repository/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
