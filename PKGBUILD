# Maintainer: Holly A. Law <lilithl@ladair.org>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=megacmd-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('x86_64')
url="http://mega.nz/cmd"
license=('custom')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'bash-completion' 'pcre' 'bzip2' 'xz' 'freeimage')
provides=('megacmd' 'ffmpeg-mega')
source=('LICENSE'
	"https://mega.nz/linux/repo/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst"
	"https://mega.nz/linux/repo/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst.sig")
sha256sums=('SKIP' 'SKIP' 'SKIP')
validpgpkeys=('B01C811880480C854C73EC7E1A664B787094A482')

package() {
	cd "$srcdir"

	# Files
	install -d "${pkgdir}/usr"
	install -d "${pkgdir}/etc"
	cp -R "$srcdir/usr" "${pkgdir}"
	cp -R "$srcdir/etc" "${pkgdir}"

	# Copy license
	install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
