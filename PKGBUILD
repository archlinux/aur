# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux-gtk
pkgname="$_pkgbase-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc='GNOME app to set up and watch conflux syncs'
arch=('x86_64')
url='https://github.com/AperteDev/conflux'
license=('GPL-3.0-or-later')
depends=('conflux' 'gcc-libs' 'glib2' 'glibc' 'gtk4' 'libadwaita>=1:1.7' 'openssl' 'polkit' 'zlib')
optdepends=("libsecret: keep the remotes' passwords in the keyring")
provides=("$_pkgbase")
conflicts=("$_pkgbase")
# The release's tarball of the app: its files, to unpack into /.
source=("$_pkgbase-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz")
noextract=("$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums=('1ee3980d56882c11e13e48c7fa8ab88d2189ff8a2bdafc7fdab7cc8293c04eeb')

package() {
	bsdtar -xpf "$_pkgbase-$pkgver-x86_64.tar.gz" -C "$pkgdir"
	mv "$pkgdir/usr/share/licenses/$_pkgbase" "$pkgdir/usr/share/licenses/$pkgname"
}
