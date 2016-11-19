
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=spriteilluminator
pkgver=1.3.1
pkgrel=1
pkgdesc="Image manipulation tool designed with game developers in mind"
arch=('x86_64')
url="http://www.codeandweb.com"
license=('custom:spriteilluminator')
depends=('glib2' 'hicolor-icon-theme')
install='spriteilluminator.install'
source=("https://www.codeandweb.com/download/$pkgname/$pkgver/SpriteIlluminator-$pkgver-ubuntu64.deb")
sha256sums=('1ddc5e8b48c0797011f3699f147a16efd0219d6c9d76d374de2555d015de3f84')

prepare() {
  tar -xvf data.tar.xz
}

package() {
  cp -r ./usr "$pkgdir"

  install -Dm644 ./usr/share/spriteilluminator/documents/LicenseAgreement.html \
    "$pkgdir/usr/share/licenses/$pkgname/LicenseAgreement.html"
}
