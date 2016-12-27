# Maintainer: Leonardo19

pkgname=mailru-cloud
pkgver=15.06.0112
pkgrel=1
pkgdesc="Client for Mail.ru Cloud service"
arch=('x86_64' 'i686')
url="https://cloud.mail.ru/"
license=("custom")
depends=("qt5-base" "qt5-x11extras")

majver=15.06
minver=0112
fullname=mail.ru-cloud

source_x86_64=("https://linuxdesktopcloud.mail.ru/rpm/default/mail.ru-cloud-fedora-15.06-0112.x86_64.rpm")
source_i686=("https://linuxdesktopcloud.mail.ru/rpm/default/mail.ru-cloud-fedora-15.06-0112.i386.rpm")
sha256sums_x86_64=("0e5c7df130d67eaff95f665cb25a67ebab6bb49451cc1e94a0aa8ae9c4b0ab44")
sha256sums_i686=("5095246a1a2040b7bde77e1e35fe9eb3551a76dd9b23aa472de75034eaa04fee")

package() {
    cd "${srcdir}"
	sed -i 's/Network/Internet;Network/g' usr/share/applications/mail.ru-cloud.desktop
	sed -i 's/=cloud/=mailru-cloud/g' usr/share/applications/mail.ru-cloud.desktop
	cp -r usr $pkgdir
	cd $pkgdir
	mv usr/bin/cloud usr/bin/mailru-cloud
}

