# Maintainer: Naleo Hyde <naleo dot hyde at gmail dot com>
pkgname=db-derby
pkgver=10.15.2.0
pkgrel=1
pkgdesc="open source relational database implemented entirely in Java"
arch=('any')
url="https://db.apache.org/derby/"
license=('Apache')
install='derby.install'
depends=(
    'java-environment'
    'bash'
)
source=("https://dlcdn.apache.org//db/derby/$pkgname-$pkgver/$pkgname-$pkgver-bin.tar.gz"
        "derby.sh")

package() {
  mkdir -p "$pkgdir"/opt/Apache
  cp "$srcdir"/$pkgname-$pkgver-bin.tar.gz "$pkgdir"/opt/Apache
  cd "$pkgdir"/opt/Apache
  tar xzvf $pkgname-$pkgver-bin.tar.gz
  mv $pkgname-$pkgver-bin $pkgname
  rm $pkgname-$pkgver-bin.tar.gz

  #add classpath
  mkdir -p "$pkgdir"/etc/profile.d
  install "$srcdir"/derby.sh "$pkgdir"/etc/profile.d/
  
}

sha256sums=('ac51246a2d9eef70cecd6562075b30aa9953f622cbd2cd3551bc3d239dc6f02a'
            'bac5fc5a8f0d36785820774f31b89707d4063223718a5d309e1b7b6921a66222')
