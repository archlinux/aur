# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='ablavema-bin'
_pkgname='ablavema'
pkgver=0.2.0
pkgtarget='x86_64-unknown-linux-gnu'
pkgrel=1
pkgdesc='A Blender launcher and version manager'
arch=('x86_64')
url='https://github.com/AlexChaplinBraz/Ablavema'
license=('MIT')
depends=('fontconfig' 'freetype2' 'glibc' 'xz' 'bzip2' 'libx11' 'gcc-libs')
optdepends=(
    'zenity: graphical dialog'
    'kdialog: graphical dialog'
)
conflicts=('ablavema' 'ablavema-git')
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-$pkgtarget.tar.gz")
sha256sums_x86_64=('7984c625fcc696796a51e8ff16b81a6bc7d4ff31d63b19bef1df5d0a66cf027e')

package() {
	install -Dm644 "$srcdir/$_pkgname-$pkgver-$pkgtarget/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-$pkgtarget/Ablavema.desktop" "$pkgdir/usr/share/applications/Ablavema.desktop"
	install -Dm644 "$srcdir/$_pkgname-$pkgver-$pkgtarget/Ablavema.png" "$pkgdir/usr/share/pixmaps/Ablavema.png"
	install -Dm755 "$srcdir/$_pkgname-$pkgver-$pkgtarget/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

