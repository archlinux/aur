# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=voadi
pkgver=0.3
pkgrel=3
pkgdesc='Vegan on a Desert Island: 2D adventure game about being a vegan on a desert island'
arch=('any')
url='https://voadi.com'
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
source=("https://gitlab.com/$pkgname/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('bae0f590dde9b7866c69d5c85a560cc62b8265add59e16d39e6c4966fef8a77f572490d3d36d19ce277bc00909b96130466863ae9487aa137ec385a719ce7c5a'
        '386cdde4e63fafb8476fe1e4e4adad63e9893e1fc58a1d0eb8b9588d0e6b246b097366221bb2813f4e714982cfad8a131c9e4809b73d86bfab92a67842227748'
        '2de9a3b92d5376c62fcd4c00890001119c9565df7f538469828aaf781c2d70b24443d2996b99af37b5c1f119a30acd49ee734feff4e7ae677a104947cb6a3598'
        '958ff3f6491cd16ed62ef91e631c3c54d4a944d38b10ef244accb7a25f35984b67ad78d44777ac2f0ae928d06068041233d42624998c663d5892cae5cb8d5249')

prepare() {
  sed -i "s/0.2.1/0.3/" "$pkgname-v$pkgver/data/quest.dat"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  cd "$pkgname-v$pkgver"

  install -dm755 "$pkgdir/usr/share/solarus"
  cp -r data "$pkgdir/usr/share/solarus/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 attributions.txt "$pkgdir/usr/share/licenses/$pkgname/ATTRIBUTIONS"
}


