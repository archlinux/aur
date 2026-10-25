# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=todav
pkgname="$_pkgbase-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc='Tasks and calendar kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/todav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring'
            'gnome-shell-extension-todav: tasks, month and agenda in the GNOME top bar')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz")
noextract=("$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('a9d3f3a9138b612e83f7b6b61aa1166915381a7f56103628983173ea3de0fda6')

package() {
	bsdtar -xf "$_pkgbase-$pkgver-x86_64.tar.gz" -C "$pkgdir" --no-same-owner
	# The extension is packaged on its own (gnome-shell-extension-todav-bin).
	rm -r "$pkgdir/usr/share/gnome-shell"
}
