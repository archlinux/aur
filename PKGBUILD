# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=1.0.5
pkgrel=1
pkgdesc="
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
depends=('nodejs')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('00ade8ff0af5859ea4ba65b293fd5e0f690b2f377801a778989356b9c37abf616d1d9b2faad58f85729bdc8959c52c9ec061e845f606de5984566d5a2a441b0f')
 
prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz
}

package() {
  cd $srcdir

  msg2 "  -> Installing program..."

  cp -r {opt/,usr/} $pkgdir/
  
install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
     #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
