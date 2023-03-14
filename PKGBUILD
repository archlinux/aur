# Maintainer: Naleo Hyde <naleo dot hyde at gmail dot com>
pkgname=db-derby
pkgver=10.16.1.1
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

sha256sums=('37aef8dca42061d5867afb2009c8d7a80e68c16e56aecaf088f3e30e470d9ef6'
            'bac5fc5a8f0d36785820774f31b89707d4063223718a5d309e1b7b6921a66222')
