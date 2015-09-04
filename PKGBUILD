# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=1.0-1
_tag="${_realver}"
pkgver=${_realver/-/.}
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/rhinstaller/blivet-gui'
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-meh' 'python-pid')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/rhinstaller/blivet-gui/archive/${_tag}.tar.gz")
sha256sums=('2911d18372503d3369208680502230bbb3b287e64481d4c1e1b393a5f3eabdf7')

package() {
	cd "${srcdir}/${pkgname}-${_tag}/"

	python setup.py install --root="${pkgdir}" --optimize=1

	install -D -m0644 blivet-gui.desktop "${pkgdir}/usr/share/applications/blivet-gui.desktop"
	install -D -m0644 org.fedoraproject.pkexec.blivet-gui.policy "${pkgdir}/usr/share/polkit-1/actions/org.fedoraproject.pkexec.blivet-gui.policy"
}

