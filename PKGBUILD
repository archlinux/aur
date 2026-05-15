# Maintainer: knedl1k <knedl1k at tuta dot io>
# Contributor: Holly A. Law <lilithl@ladair.org>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=megacmd-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('x86_64')
url="http://mega.nz/cmd"
license=('custom:LicenseRef-megacmd')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'pcre' 'bzip2' 'xz' 'fuse2')
optdepends=('freeimage: For image preview/thumbnail support')
provides=('megacmd' 'ffmpeg-mega')
conflicts=('megacmd' 'ffmpeg-mega')
source=('LICENSE'
		"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-$pkgver-1-x86_64.pkg.tar.zst"
		"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-$pkgver-1-x86_64.pkg.tar.zst.sig")
sha256sums=('SKIP'
			'4375fd48f5304e38249b71c3779a05812494748fc1f97cec28adceb993f30753'
			'be2ac696468393c93736176c4a55fc343208e66ac6e2a36a80e3f1bf548d5919')
validpgpkeys=('B01C811880480C854C73EC7E1A664B787094A482')

package() {
	for dir in usr etc opt; do
		if [[ -d "$srcdir/$dir" ]]; then
			cp -a "$srcdir/$dir" "$pkgdir/"
		fi
	done

	install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
