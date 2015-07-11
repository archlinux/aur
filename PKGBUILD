# Maintainer: Alexander Konarev  <avkonarev@gmail.com>
# Author: Andrey Ovsankin aka EvilBeaver

pkgname=onescript
pkgver=1.0.10
pkgrel=2
pkgdesc="This project is an alternative implementation of the virtual machine, execute scripts in the language of the 1C:Enterprise"
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="https://bitbucket.org/EvilBeaver/1script"
depends=('mono')
makedepens=('unzip')

source=(
        "https://bitbucket.org/EvilBeaver/1script/downloads/OneScript-$pkgver-bin.zip"
        "oscript"
        )
noextract=("OneScript-$pkgver-bin.zip")

md5sums=('b68f9065bd9146c13f809a8fdb6b3809'
         '907f8929debbe8a307fbe15b5f60cf68')

prepare() {
  cd $srcdir
  unzip OneScript-$pkgver-bin.zip -d OneScript-$pkgver
}

package() {
  cd $srcdir
  install -Dm755 oscript "$pkgdir/usr/bin/oscript"

  cd $srcdir/OneScript-$pkgver/
  mkdir -p "$pkgdir/usr/lib/oscript"
  cp -r .  "$pkgdir/usr/lib/oscript"
}
