# Maintainer: Snowy-Fluffy <snowy.lnnk@gmail.com>

pkgname=freshgram-bin
pkgver=7.6.0
pkgrel=1
pkgdesc='Breaking ToS Telegram Desktop fork with a lot of security features, all AyuGram features, and a lot of design styles (prebuilt)'
arch=('x86_64')
url='https://github.com/Snowy-Fluffy/freshGram'
license=('GPL-3.0-or-later')
depends=(
	'cairo'
	'fontconfig'
	'freetype2'
	'gcc-libs'
	'glib2'
	'glibc'
	'hicolor-icon-theme'
	'libx11'
	'libxcb'
	'pango'
)
optdepends=('xdg-desktop-portal: file dialogs and screen sharing')
provides=("freshgram=$pkgver")
conflicts=('freshgram' 'freshgram-git')
options=('!strip' '!debug')
source=("freshGram-linux-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/freshGram-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/Snowy-Fluffy/freshGram/v$pkgver/LICENSE")
noextract=("freshGram-linux-x86_64-$pkgver.tar.gz")
sha256sums=('a5f526a5b9f9f12b7fc1a70f03c551e3d82b53662d43764387829b8fda1ca117'
            'a728b65d02eeaf6b50c075a33b76107c652c3e5a12ff67f53682c83d47a23e1e')

package() {
	bsdtar -xf "$srcdir/freshGram-linux-x86_64-$pkgver.tar.gz" --no-same-owner -C "$pkgdir"
	install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
