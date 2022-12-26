# Maintainer: 0xEFF <hecksadecimal@out/look.com>

_pkgname=godot4
pkgname=${_pkgname}-bin
pkgver=beta10
pkgrel=1
pkgdesc="Godot Game Engine: An advanced, feature packed, multi-platform 2D and 3D game engine."
url="http://www.godotengine.org"
license=('MIT')
arch=('i686' 'x86_64')
depends=('glu' 'libxcursor' 'libxinerama' 'alsa-lib' 'freetype2' 'mesa')
optdepends=()
conflicts=("godot4")
provides=("godot4")

source=(
	godot4.desktop
	icon.png
	LICENSE
)
source_i686=($_pkgname-$pkgver-32bit.zip::https://downloads.tuxfamily.org/godotengine/4.0/$pkgver/Godot_v4.0-${pkgver}_linux.x86_32.zip)
source_x86_64=($_pkgname-$pkgver-64bit.zip::https://downloads.tuxfamily.org/godotengine/4.0/$pkgver/Godot_v4.0-${pkgver}_linux.x86_64.zip)

sha512sums=('a32864067fcd034cc95b0a39ba575dafe62ca8f67b93f1cc0ede5a471d12d73ba525032e1ba1b411f1ca550a106498b5e71a9d491663a39c67175740f07cad87'
            '3598100251a74a6595ffc002df0adac18c37c9367a4ef148ef7f057d547ed15aaaa07140705d4185394b888c0f5fd8446de35f97625a80d1c3a2132a0418b71e'
            'd38569e26e77b238cd9bf60d0ba7dc76367b5f25f68e5d45185d10fdf4de20c696431ab4eed815b7ad611e997d5ddadd96d70f1f6d4388c18b1553b81d4b6738')
sha512sums_i686=('76d00b7e03e9726008899baec9f1501680a94b4b62d84b36e2b6aecc6c8964a01816204ff2289156e385fff07d1133f47032bfb9b44b22bbad16ed2e313681e2')
sha512sums_x86_64=('0d8a9d6eaca4211247b21236479866bddd7c77d7ced3d97ae640dc499a5de58ee4aedad1727308a26308c201abb8c93916fafa4fb8010d84aa96ac93d3dc1a7e')


package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      install -Dm755 "$srcdir/Godot_v4.0-${pkgver}_linux.x86_32" "$pkgdir/usr/bin/godot4"
    ;;
    "x86_64")
      install -Dm755 "$srcdir/Godot_v4.0-${pkgver}_linux.x86_64" "$pkgdir/usr/bin/godot4"
    ;;
  esac
  
  install -Dm644 "$srcdir/godot4.desktop" "$pkgdir/usr/share/applications/godot4.desktop"
  install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/pixmaps/godot4.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


