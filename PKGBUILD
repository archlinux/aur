# Maintainer: lamarpavel

pkgname=gog-luftrausers
_original="Luftrausers"
pkgver=2.0.0.3
pkgrel=1
pkgdesc="Fast paced 2D air combat game from Vlambeer"
arch=('i686' 'x86_64')
url="https://www.gog.com/game/luftrausers"
license=('custom')
depends=('flac' 'freetype2' 'libogg' 'sdl2' 'libsndfile' 'libvorbis' 'zlib')
depends_x86_64=('openal')
provides=('luftrausers')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://${pkgname//-/_}_$pkgver.sh"
        "$pkgname"
        "$pkgname.desktop")
sha512sums=('351321ef2f932593f861df8d83bf0b406db231295eaef3d328089826c7cf10977985c83fbc909f69760d1e1ce2e6fbf60eec09bceaa7da1d26d2e4713f2f0ffa'
            '8fafd9fdf8e007cfa652daa6698978b2bf6f0d64d7bf6f4681b9741f95ceda4a20ee24105b42dbc24df7de1d28cff77d8035a65ed9c4d3fa0b199feb190d64d9'
            '3cbb5b24ee770134f617bc25c32d78538c58cbfb2b5d55a0c8208054b6807df287d3993fe3d9be76a491a76a2b24d62b24c08f658e9c65a3c2586279f47bf1a9')
PKGEXT=".pkg.tar"

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r data/noarch/* "$pkgdir/opt/$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

