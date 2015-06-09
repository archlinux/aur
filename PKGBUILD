# Maintainer: piernov <piernov@piernov.org

pkgname=metronome-mod_auth_pam
pkgver=r4.1f84d9a
pkgrel=1
pkgdesc='PAM authentication for Metronome'
arch=('i686' 'x86_64')
url='https://code.google.com/p/prosody-modules/wiki/mod_auth_pam'
depends=('lua51-pam' 'metronome-hg')
makedepends=('git')
source=("metronome-mod_auth_pam::git+git://github.com/piernov/prosody-mod_auth_pam.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -D mod_auth_pam.lua "$pkgdir/usr/lib/metronome/modules/mod_auth_pam.lua"
}

