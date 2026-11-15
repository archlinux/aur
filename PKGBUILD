# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=todav
pkgname="$_pkgbase-bin"
pkgver=2.8.2
pkgrel=1
pkgdesc='Tasks and calendar kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/todav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring'
            'gnome-shell-extension-todav: tasks, month and agenda in the GNOME top bar')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz")
noextract=("$_pkgbase-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('ed2a895f0f63bf3b416f549e74817075e7f3740df3aeaae5e5e8b9bd3ecfdbd1')

package() {
	bsdtar -xf "$_pkgbase-$pkgver-x86_64.tar.gz" -C "$pkgdir" --no-same-owner
	# The extension is packaged on its own (gnome-shell-extension-todav-bin).
	rm -r "$pkgdir/usr/share/gnome-shell/extensions"
}
