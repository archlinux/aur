# Maintainer: knedl1k <knedl1k at tuta dot io>
# Contributor: Holly A. Law <lilithl@ladair.org>
# Contributor: Oirio Joshi <joshirio@protonmail.com>

pkgname=megacmd-bin
pkgver=2.6.0
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
		"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-$pkgver-2-x86_64.pkg.tar.zst"
		"https://mega.nz/linux/repo/Arch_Extra/x86_64//megacmd-$pkgver-2-x86_64.pkg.tar.zst.sig")
sha256sums=('SKIP'
			'a2735a3ae2f38fe283773c2229589c8e328c188d21bf0fc95135662c3d2a55c3'
			'cb02815d823050e089f048d5dcc5ebd9b49798837ea608a8da00568d10649b79')
validpgpkeys=('B01C811880480C854C73EC7E1A664B787094A482')

package() {
	for dir in usr etc opt; do
		if [[ -d "$srcdir/$dir" ]]; then
			cp -a "$srcdir/$dir" "$pkgdir/"
		fi
	done

	install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
