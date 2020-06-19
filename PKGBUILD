# Maintainer: Essem <smswessem at gmail dot com>

pkgname=goattracker-ubuntu-bin
pkgver=2.75
pkgrel=1
pkgdesc="Crossplatform C64 music tracker (Ubuntu-based prebuilt package)"
arch=('x86_64')
url="http://sourceforge.net/projects/goattracker2/"
license=('GPL')
depends=('sdl')
conflicts=('goattracker')
replaces=('goattracker')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/${pkgname%-ubuntu-bin}/${pkgname%-ubuntu-bin}_${pkgver}-3build1_amd64.deb")
md5sums=('0042f11a8aeb6c0e7be8ca3d26268f05')

package()
{
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/goattracker"
	mkdir -p "${pkgdir}/usr/share/goattracker"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons"

	tar xf "${srcdir}/data.tar.xz"

	install -Dm755 "${srcdir}/usr/bin/goattracker" "${pkgdir}/usr/bin/"
	install -Dm755 ${srcdir}/usr/lib/goattracker/{ins2snd2,mod2sng,sngspli2} "${pkgdir}/usr/bin/"

	install -Dm644 "${srcdir}/usr/share/applications/goattracker.desktop" "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/usr/share/icons/goattrk2.xpm" "${pkgdir}/usr/share/icons/"
	install -d "${srcdir}/usr/share/doc/goattracker/examples" "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "${srcdir}/usr/share/doc/goattracker/goat_tracker_commands.pdf.gz" "${pkgdir}/usr/share/goattracker/"
	install -Dm644 "${srcdir}/usr/share/doc/goattracker/readme.txt.gz" "${pkgdir}/usr/share/goattracker/README"
}
