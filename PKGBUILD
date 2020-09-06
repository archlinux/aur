# Maintainer: Lionel Miller <delonorm at gmail dot com>

pkgname=kontur-plugin
pkgver=4.0.2.130
pkgrel=1
pkgdesc="Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services."
arch=('x86_64')
_filename="kontur.plugin_amd64.deb"
license=('proprietary')
depends=(
	'gtk3'
	'cryptopro-csp-k1'
)
url="https://help.kontur.ru/plugin/"
source=("https://help.kontur.ru/plugin/beta/dist/$_filename")
sha512sums=('f581ee668dafba6973800af64988335fb19858a2923f0f754dbcc645009b8753d8669ba815a44d7b1794bae6b77878c46a249e13028a108aa1fee6f177fe115f')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
	rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}
