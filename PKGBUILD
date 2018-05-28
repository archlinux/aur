# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology
An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
depends=('nodejs' 'glib2')
source=("$url/releases/download/v$pkgver/Archipelago_${pkgver}_amd64.deb")
sha512sums=('861f380d6f2aee4db4e293758bec6595b16cfb73e2c39fdc492cf78ee9a4372308c90b1a2b92d03530b23528739b5edc6fd71c3c56d7bd583ccd43504daf9e44')
 
prepare() {
  cd $srcdir

  tar -xf data.tar.xz
}

package() {
  cd $srcdir

  cp -r {opt/,usr/} $pkgdir/
  
install -Dm755 /dev/stdin "$pkgdir"/usr/bin/archipelago <<END
    #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
