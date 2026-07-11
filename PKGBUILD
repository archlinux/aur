# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc='Background file-sync daemon syncing local directories to multiple remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/SelfRef/conflux'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
backup=('etc/conflux/config.toml')
source_x86_64=("$_pkgbase-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$_pkgbase-v$pkgver-aarch64-linux.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-v$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('42c2814611ee0090c23778702352d95d2ac6dd6201af76063bb5875a37631084')
sha256sums_aarch64=('6f6c5a5564fc062027cf6802704989a926f10c9d0a522c48de5974823ff29a59')

package() {
	cp -a "$_pkgbase-v$pkgver-$CARCH-linux/." "$pkgdir/"
	mv "$pkgdir/usr/share/licenses/$_pkgbase" "$pkgdir/usr/share/licenses/$pkgname"
}
