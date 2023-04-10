# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=ecode-bin
pkgver=0.4.8
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance."
url="https://github.com/SpartanJ/ecode"
license=('MIT')
arch=('x86_64' 'aarch64')
epoch=
groups=()
depends=(gcc-libs libglvnd sdl2 bash glibc libelf)
makedepends=()
checkdepends=()
optdepends=()
provides=(ecode)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
validpgpkeys=()
source=(LICENSE::https://raw.githubusercontent.com/SpartanJ/ecode/main/LICENSE
ecode.sh)
source_x86_64=("https://github.com/SpartanJ/ecode/releases/download/ecode-$pkgver/ecode-linux-$pkgver-x86_64.tar.gz")
source_aarch64=("https://github.com/SpartanJ/ecode/releases/download/ecode-$pkgver/ecode-linux-$pkgver-aarch64.tar.gz")
sha256sums=('5fcb9a831d8efabb08cd20b7ca6000ca333115d60de477fa27909a14306188b0'
            '40460ea0c5d9c523274b53cf41e642bf6ed36406c14f6ce95a33e42e68c71923')
sha256sums_x86_64=('31b5df3360525682cee4359ae93bb2c15c2d5fb2d3597aca4b72c41537b5e9ca')
sha256sums_aarch64=('a59c36c6886dc23b646af78b1e6dc87e331b19a0b8edec5240a3821f379d4b6b')

package() {
	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm755 ecode.sh "$pkgdir"/usr/bin/ecode
  install -Dm644 "$srcdir"/ecode/ecode.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/ecode/ecode.png -t "$pkgdir"/usr/share/pixmaps/
  rm "$srcdir"/ecode/ecode.desktop
  rm "$srcdir"/ecode/ecode.png
	# The libs and assets path are fixed, so I put them in /opt/
	install -d "$pkgdir"/opt/$pkgname/
	cp -av ecode/* "$pkgdir"/opt/$pkgname/
}

# vim: ts=2 sw=2 et:
