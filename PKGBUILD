# Maintainer: Holly A. Law <lilithl@ladair.org>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=megacmd-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('x86_64')
url="http://mega.nz/cmd"
license=('custom')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'bash-completion' 'pcre' 'bzip2' 'xz' 'freeimage')
provides=('megacmd' 'ffmpeg-mega')
source=('LICENSE'
	"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-2.1.1-1-x86_64.pkg.tar.zst"
	"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-2.1.1-1-x86_64.pkg.tar.zst.sig")
sha256sums=('772d38729ab816eb94dbe30de277ffcc5af4e5d2c451cf7c071031ebe78f44ea'
            'ebfa5f1703ba3987057cb91066b6f9877ff795ef98d3c2dafd2a53a42afe070e'
            'SKIP')
validpgpkeys=('B01C811880480C854C73EC7E1A664B787094A482')

package() {
	cd "$srcdir"

	# Files
	install -d "${pkgdir}/usr"
	install -d "${pkgdir}/etc"
        install -d "${pkgdir}/opt"
	cp -R "$srcdir/usr" "${pkgdir}"
	cp -R "$srcdir/etc" "${pkgdir}"
        cp -R "$srcdir/opt" "${pkgdir}"

	# Copy license
	install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
