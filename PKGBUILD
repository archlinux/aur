# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=0.2.3-1
_tag="${_realver}"
pkgver=${_realver/-/.}
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='http://github.com/vojtechtrefny/blivet-gui'
depends=('python2' 'python2-blivet' 'python2-cairo' 'python2-gobject' 'urlgrabber')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/vojtechtrefny/blivet-gui/archive/${_tag}.tar.gz")

package() {
	cd "${srcdir}/${pkgname}-${_tag}/"

	python2 setup.py install --root="${pkgdir}" --optimize=1

	install -D -m0644 blivet-gui.desktop "${pkgdir}/usr/share/applications/blivet-gui.desktop"
	install -D -m0644 org.fedoraproject.pkexec.blivet-gui.policy "${pkgdir}/usr/share/polkit-1/actions/org.fedoraproject.pkexec.blivet-gui.policy"
}

sha256sums=('cca0bf30c98df832587bb055ef585848d98de1dcf3e6b86f995d9561faa973a7')
