# Maintainer: Edmund Lodewijks < e dot lodewijks at gmail . com>
# Contributor: Matthew Brian Cohen <cohen at matthewbriancohen dot com>
# Contributor: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_pkgname='SpiderOak One'
pkgver=7.5.2
pkgrel=1
pkgdesc="Secure file backup, sync and sharing client. SpiderOak One client."
arch=('x86_64')
url="https://crossclave.com/"
license=('LicenseRef-SpiderOakONE')
depends=('glibc' 'curl')
makedepends=()
provides=('spideroak')
options=('!strip')
install="${pkgname}".install
source=("https://spideroak-releases.s3.us-east-2.amazonaws.com/spideroakone_${pkgver}_amd64.deb"
	'LICENSE')
sha256sums=('2c012c296b23d6281c215a7dedc6702d858507793d44a047afc5907853aacc35'
	    '62271420e251febb88cec99de1559002237ab980c2912e091d2f0d1b8bec7141')

package() {
tar -Jxf "${srcdir}"/data.tar.xz -C "$pkgdir"/

# We don't need APT files, nor menu files, and Arch Linux sets a higher
# `fs.inotify.max_user_watches` than what this configuration provides.
rm -r "$pkgdir"/etc/

install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
