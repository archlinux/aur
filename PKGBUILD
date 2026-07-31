# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-bin"
pkgver=1.1.0
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
sha256sums_x86_64=('605d925fb49dc65b5a70ab2539b8130c39374d9503e7a51c86f268a36f35a80f')
sha256sums_aarch64=('8f7a83bd994d6df17ae1595640c319574f7e48c7b4c909f6ff04ab734beb2190')

package() {
	cp -a "$_pkgbase-v$pkgver-$CARCH-linux/." "$pkgdir/"
	mv "$pkgdir/usr/share/licenses/$_pkgbase" "$pkgdir/usr/share/licenses/$pkgname"
}
