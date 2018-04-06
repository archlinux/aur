# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=panther
pkgver=13.1
pkgrel=2
pkgdesc='The PANTHER (Protein ANalysis THrough Evolutionary Relationships) Classification System was designed to classify proteins (and their genes) in order to facilitate high-throughput analysis.'
arch=('any')
license=('GPL')
url='ftp://ftp.pantherdb.org'
depends=('hmmer')
makedepends=('bash')
provides=()
path="/panther_library/current_release"
source=(
        "$url$path/PANTHER13.1_hmmscoring.tgz"
        )
sha512sums=(
'9e9b6790d06f24ddc22e77e1613d4d76eb1a586380b609b4512defc4fae116a42c8603259f643e6b30b5588fc95092ad7aa57899d879bf52a8145781e1ee15d3'
)

package() {
  mkdir -p  "$pkgdir/opt/$pkgname/"
  #find * -maxdepth 0 -regex '.*\.gz' -prune -o -print0 | xargs -0 -i cp -f {} "$pkgdir/opt/$pkgname/"
  cp -rfHL hmmscoring/PANTHER13.1/* "$pkgdir/opt/$pkgname/"
}
