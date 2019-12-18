# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-ubuntu-arabic
pkgver=0.84+arabic
pkgrel=2
pkgdesc="Public release of Arabic font to Ubuntu Xenial Xerus"
arch=('any')
url="https://launchpad.net/ubuntu/+source/ubuntu-font-family-sources/0.84~mono0.83+arabicfontconfig-0ubuntu1"
license=('custom:Ubuntu Font Licence 1.0')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-font-family-sources_0.84~mono0.83+arabicfontconfig.orig-arabicbeta.tar.gz"
        "LICENCE.txt"
        "65-ubuntu-arabic.conf")
md5sums=('561ba71ea16185e0fc389890c2631724'
         '325a1a9029112a2405e743c7f816427b'
         'e8d413b3e001764007e9fc26d4dcf7dd')

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/ ${pkgdir}/etc/fonts/conf.d
	install -m644 ${srcdir}/arabicbeta/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${srcdir}/LICENCE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 ${srcdir}/65-ubuntu-arabic.conf ${pkgdir}/etc/fonts/conf.avail/65-ubuntu-arabic.conf
	ln -s ../conf.avail/65-ubuntu-arabic.conf ${pkgdir}/etc/fonts/conf.d/65-ubuntu-arabic.conf
}
