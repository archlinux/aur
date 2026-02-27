# Maintainer : Syazmi <mrcorpzpro@gmail.com>

pkgname=funkin-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="A rhythm game made with HaxeFlixel"
arch=(x86_64)
url="https://www.newgrounds.com/portal/view/770371"
license=(Apache)
depends=(vlc fuse3 fuse-overlayfs)
source=("https://github.com/FunkinCrew/Funkin/releases/download/v$pkgver/funkin-linux-64bit.zip"
        "funkin.desktop"
        "funkin.sh")
sha256sums=("43e7cb6f2fce7ab4ba420149701dca6e214ce8b888d904627587f2e98c0672df"
            "fe2d70bffe9c8702c35da89e7fca84200bd05bee104d1014a1c444462527b6ba"
            "c409b0fa9d1194801f7a0c90f711e4a1194467f1d2524417d3e08e8facbf8d32")

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "funkin.sh" "$pkgdir/usr/bin/funkin"

  mkdir -p "$pkgdir/usr/share"
  cp -r "$srcdir" "$pkgdir/usr/share/funkin"

  # Desktop entry
  install -Dm644 "$srcdir/funkin.desktop" \
    "$pkgdir/usr/share/applications/funkin.desktop"

}
