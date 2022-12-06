_pkgname=asteroids
pkgname=${_pkgname}-bin
pkgver=1.03
pkgrel=1
pkgdesc='Anti-stress shooter game'
url='https://codeberg.org/Denotatum/Asteroids'
license=('GPLv3')
arch=('x86_64')
provides=('asteroids')
replaces=($pkgname)
conflicts=($pkgname)
depends=('alsa-lib' 'glu' 'libglvnd' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'mesa' 'pulseaudio')
optdepends=()
_pkgtag="$pkgname-$pkgver"
_pkgtar="$_pkgtag.tar.gz"
noextract=("$_pkgtar")
install="${pkgname}.install"
source=("$_pkgtar::https://codeberg.org/attachments/34feeb15-f8f9-460f-a7aa-e5cdcdf72cef"
        Asteroids.desktop)
sha256sums=('113e1514a6ab4e56324aa8aa11a6d3337d931c5fcafad08d3c2b6d15f9fa34a3'
            'f3be9cdabcd8a64cedff55f83123e054d3300dd60bdc88d29894e06d63f69aa5')

prepare() {
  mkdir -p "$_pkgtag"
  tar xf "$_pkgtar" -C "$_pkgtag" --strip-components 1
}

package() {
	install ./Asteroids.desktop "${pkgdir}/usr/share/applications"
	cd "$_pkgtag"
	install -d "${pkgdir}/usr/share/applications"
	install -D Asteroids.x86_64 "$pkgdir/usr/bin/asteroids"
} 
