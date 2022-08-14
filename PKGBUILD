# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=iran-nastaliq-fonts
pkgver=2.001
pkgrel=1
pkgdesc="A free Unicode calligraphic Persian font."
url="https://github.com/font-store/font-IranNastaliq"
arch=(any)
license=('OFL')
makedepends=('git')
provides=('ttf-iran-nastaliq' "$pkgname")
conflicts=('ttf-iran-nastaliq' "$pkgname")
replaces=('ttf-iran-nastaliq')
source=("$pkgname.zip::https://github.com/font-store/font-IranNastaliq/releases/download/v1/font-IranNastaliq-1.zip")
sha256sums=('27b8d9d38858b93f6e8ac82b52d534e03aa233530181aefaf7887113c029a248')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./font-IranNastaliq-1/old/*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./font-IranNastaliq-1/WebFonts/{*.ttf,*.woff*}
  install -Dm644 ./font-IranNastaliq-1/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
