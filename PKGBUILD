# Maintainer: Filth <filth [at] wagn [dot] me>

_pkgname="mousegun"
pkgname="$_pkgname-bin"
pkgver=1.2
pkgrel=1
pkgdesc="18+ retro FPS in which you take control of the titular character in an action filled adventure."
arch=('x86_64')
options=("!strip" "!debug")
url="https://shinlalala.itch.io/mousegun"
depends=('sh' 'glibc')
makedepends=('itchio-dlagent')
license=('custom')
source=("Mousegun $pkgver LINUX.zip::itch://shinlalala/mousegun/9774754"
        "$_pkgname.png::https://img.itch.zone/aW1nLzE1MDU0NzA0LnBuZw==/32x32%23/Aj4%2ByW.png"
        "$_pkgname.desktop"
        "$_pkgname.sh")
b2sums=('a4a99fe9947d3751e4c69b0bcc584461501d78dd628d645269cc9ca4e5dba85153f3274e01c2542bd8c6d9de27657763e6526f51df39a71f5d91ca2646eadba6'
        'e66e01e8f6c8dc713d95fc64aa1db4b5e8cb436ba3c83c687ecf1814488873e7f830380147175e06266c3fbd0b6a62d845d0560766b85a1542abb191750b659f'
        '1a148d5810d3598c847886dd07b0bc76aa839049af35d6804f28b95cff520a1dffdd5a6be61c9466d04d106d147f6716d445e7238fb208c29e22e44dab069c95'
        '43bc5283041433c65367b7734838768e2575dbb54931d2b1111cee22c826ff706071dea6f262cb294d063b2099df61f4920398f5c2e95a4da74ef825eae338c3')
DLAGENTS+=("itch::/usr/bin/itchio-dlagent %u %o")

package() {
  # Install Data
  install -Dm755 "Mousegun $pkgver.x86_64" "$pkgdir/usr/share/$_pkgname/Mousegun.x86_64" 

  # Install Launcher
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # Install Desktop
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}