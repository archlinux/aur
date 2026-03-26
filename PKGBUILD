# Maintainer: knedl1k <knedl1k at tuta dot io>
# Contributor: Holly A. Law <lilithl@ladair.org>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=megacmd-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('x86_64')
url="http://mega.nz/cmd"
license=('custom:LicenseRef-megacmd')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'pcre' 'bzip2' 'xz')
optdepends=('freeimage: For image preview/thumbnail support')
provides=('megacmd' 'ffmpeg-mega')
conflicts=('megacmd' 'ffmpeg-mega')
source=('LICENSE'
		"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-$pkgver-1-x86_64.pkg.tar.zst"
		"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-$pkgver-1-x86_64.pkg.tar.zst.sig")
sha256sums=('772d38729ab816eb94dbe30de277ffcc5af4e5d2c451cf7c071031ebe78f44ea'
			'ef595ad5ee5a8806ce4f684e0710bf8f3a1c9c74d215f2b46f784e1ab39267f8'
			'SKIP')
validpgpkeys=('B01C811880480C854C73EC7E1A664B787094A482')

package() {
	for dir in usr etc opt; do
		if [[ -d "$srcdir/$dir" ]]; then
			cp -a "$srcdir/$dir" "$pkgdir/"
		fi
	done

	install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
