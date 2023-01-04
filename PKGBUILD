# Maintainer: Jack Baines <jackbaines6@gmail.com>
pkgname='aseprite-than'
pkgver='1.2.5'
pkgrel=1
pkgdesc="A dark theme for Aseprite"
arch=('any')
url="https://tungkradle.github.io/aseprite-than/"
license=('custom:cc-by-4.0')
# In the readme, Than says it needs at least aseprite v1.2 beta 10, but the
# aseprite aur package doesn't have that version.
depends=('aseprite>=1.2')
source=("https://github.com/tungkradle/aseprite-than/releases/download/v$pkgver/than-v$pkgver.zip")
noextract=("than-v$pkgver.zip")
sha256sums=('c6788eba615423cf4e7a7c776fde4a1c2b39a60fa49e5750284d373bd0e5b712')

prepare() {
    mkdir -p aseprite-than
    cd aseprite-than
    bsdtar -xf "../${noextract[0]}"
}

package() {
    install -vDm 644 aseprite-than/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local _install_path="$pkgdir/usr/share/aseprite/data/extensions/"
    mkdir -p "$_install_path"
    cp -vr aseprite-than "$_install_path"
}
