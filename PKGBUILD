# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=wg++
pkgver=2.1.0
pkgrel=1
pkgdesc='WebGrab+Plus is a free multi-site incremental XMLTV EPG grabber.'
arch=('i686' 'x86_64')
url='http://webgrabplus.com/'
license=('custom')
depends=('mono')
provides=('wg++')
source=("http://webgrabplus.com/sites/default/files/download/SW/V2.1.0/WebGrabPlus_V2.1_install.tar.gz"
        "wg++")  
md5sums=("837d35bc377c1dc134c26a044bcee479"
	     "42d00b6bc9fa670556854968feec31fc")

package() {
	# Install application files:
	mkdir -p "${pkgdir}/opt/wg++"
	cp -R "${srcdir}/.wg++/bin" "${pkgdir}/opt/wg++/"
	cp -R "${srcdir}/.wg++/doc" "${pkgdir}/opt/wg++/"
	cp -R "${srcdir}/.wg++/siteini.pack.update" "${pkgdir}/opt/wg++/siteini.pack"

	# Install configuration files:
	mkdir -p "${pkgdir}/usr/share/wg++"

	ln -s "/opt/wg++/siteini.pack" "${pkgdir}/usr/share/wg++/siteini.pack"

	cp -R "${srcdir}/.wg++/mdb" "${pkgdir}/usr/share/wg++/"
	cp "${pkgdir}/usr/share/wg++/mdb/mdb.config.example.xml" "${pkgdir}/usr/share/wg++/mdb/mdb.config.xml"

	cp -R "${srcdir}/.wg++/rex" "${pkgdir}/usr/share/wg++/"
	cp "${pkgdir}/usr/share/wg++/rex/rex.config.example.xml" "${pkgdir}/usr/share/wg++/rex/rex.config.xml"

	cp -R "${srcdir}/.wg++/siteini.user" "${pkgdir}/usr/share/wg++/"

	cp -R "${srcdir}/.wg++/WebGrab++.config.example.xml" "${pkgdir}/usr/share/wg++/WebGrab++.config.xml"

	# Executable:
	install -Dm755 "${srcdir}/wg++" "${pkgdir}/usr/bin/wg++"
}
