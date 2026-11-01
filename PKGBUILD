# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc='Background file-sync daemon syncing local directories to multiple remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/AperteDev/conflux'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
backup=('etc/conflux/config.toml')
source_x86_64=("$_pkgbase-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$_pkgbase-v$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('a1e275097ac99bf9b5eff4239ba19b0788e9dd59f57ba8de9d1364f291c54839')
sha256sums_aarch64=('3eb0d4d6b418ae894933c0c33d51b9b19845589b12ac5baac624aadca592a957')

package() {
	cp -a "$_pkgbase-v$pkgver-$CARCH-linux/." "$pkgdir/"
	mv "$pkgdir/usr/share/licenses/$_pkgbase" "$pkgdir/usr/share/licenses/$pkgname"
}
