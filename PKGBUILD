# Maintainer: Leonidas P. Papadakos <papadakospan@gmail.com>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=megacmd-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('x86_64')
url="http://mega.nz/cmd"
license=('custom')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'bash-completion' 'pcre' 'bzip2' 'xz')
provides=('megacmd' 'ffmpeg-mega')
source=('LICENSE'
	"https://mega.nz/linux/MEGAsync/Arch_Extra/x86_64/megacmd-${pkgver}-11-x86_64.pkg.tar.zst"
	"https://mega.nz/linux/MEGAsync/Arch_Extra/x86_64/megacmd-${pkgver}-11-x86_64.pkg.tar.zst.sig")
sha256sums=('SKIP' 'SKIP' 'SKIP')
validpgpkeys=('8F208FBF12FEE766AA32AEAF03C3AD3A7F068E5D')

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
