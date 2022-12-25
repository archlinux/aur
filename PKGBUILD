# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

_pkgname=blivet-gui
pkgname=$_pkgname-git
pkgver=e77b80f
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
depends=('python' 'python-blivet-git' 'python-cairo' 'python-gobject' 'python-meh-git' 'python-pid')
source=("git+https://github.com/storaged-project/blivet-gui.git")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/$_pkgname/"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -D -m0644 blivet-gui.desktop "${pkgdir}/usr/share/applications/blivet-gui.desktop"
	install -D -m0644 org.fedoraproject.pkexec.blivet-gui.policy "${pkgdir}/usr/share/polkit-1/actions/org.fedoraproject.pkexec.blivet-gui.policy"
}
