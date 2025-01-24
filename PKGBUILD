# Maintainer: Edmund Lodewijks < e dot lodewijks at gmail . com>
# Contributor: Matthew Brian Cohen <cohen at matthewbriancohen dot com>
# Contributor: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_pkgname=SpiderOakONE
pkgver=7.5.0_1
pkgrel=2
pkgdesc="Secure file backup, sync and sharing client. SpiderOakONE client."
arch=('x86_64')
url="https://crossclave.com/"
license=('LicenseRef-SpiderOakONE')
depends=('glibc' 'curl')
makedepends=()
provides=('spideroak')
options=('!strip')
install="${pkgname}".install
source=("https://spideroak-releases.s3.us-east-2.amazonaws.com/SpiderOakONE_${pkgver}_amd64.deb"
	'LICENSE')
sha256sums=('5d526e4c27124a8b37285e7ee7ca4feec61439ffcfe291d9bd14509a0d784ca2'
	    'ee0d1c8c41e95ba2a11de4fe5cf0d89e2b237afc86dc411f58f3b388db8198e9')

package() {
tar -Jxf "${srcdir}"/data.tar.xz -C "$pkgdir"/

# We don't need APT files, nor menu files, and Arch Linux sets a higher
# `fs.inotify.max_user_watches` than what this configuration provides.
rm -r "$pkgdir"/etc/

install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
