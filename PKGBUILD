# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>

pkgname=alephone-tempus_irae
pkgver=2.0
pkgrel=1
pkgdesc="The Aleph One release of the Marathon Infinity scenario by Chris Borowiec (aka: Nardo/Borzz)."
arch=('any')
url="http://nardo.bungie.org/alephone.php"
license=('custom')
depends=('alephone')
source=("http://nardo.bungie.org/files/Tempus_Irae.zip"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=("9fbd922a960b6056ac4a054be3c09934b2b6d393b43931474a7b1303f43d0e22"
            "8d4632fb09fdce40aa500d62d487dede9850d29d424fc47c1a12fba6f7c9091b"
            "d7b085803e1c3936425dbe40eaa1933367e43dbca628861926f9b8837cf9ff57")

build() {
  tail "Tempus_Irae/Read Me First.txt" > LICENSE
}

package() {
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -d "$pkgdir"/usr/share/AlephOne/scenarios
  cp -r "Tempus_Irae" "$pkgdir"/usr/share/AlephOne/scenarios/tempus_irae
  find "$pkgdir"/usr/share/AlephOne/scenarios/tempus_irae -type f -exec chmod 644 {} \;
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
