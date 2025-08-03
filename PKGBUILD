pkgname=almalinux-wallpapers
pkgver=10.0
pkgrel=1
pkgdesc="Official AlmaLinux 10 wallpapers (day and night versions)"
arch=('any')
url="https://almalinux.org"
license=('custom:AlmaLinux-logos')
depends=('xdg-user-dirs')
source=("https://vault.almalinux.org/10.0/AppStream/Source/Packages/almalinux-logos-100.3-3.el10_0.src.rpm")
noextract=('almalinux-logos-100.3-3.el10_0.src.rpm')
sha256sums=(
  '6a735fb00d5a93fc53fa68fe3bab780605bb1f99706e5ed381e2e3fa557b7717'
)



prepare() {
  bsdtar -xf almalinux-logos-100.3-3.el10_0.src.rpm
  tar -xf almalinux-logos-100.3.tar.xz
}

package() {
  install -dm755 "$pkgdir/usr/share/backgrounds/almalinux"

  install -m644 almalinux-logos-100.3/backgrounds/almalinux-day.jpg "$pkgdir/usr/share/backgrounds/almalinux/"
  install -m644 almalinux-logos-100.3/backgrounds/almalinux-night.jpg "$pkgdir/usr/share/backgrounds/almalinux/"
  install -Dm644 almalinux-logos-100.3/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
