# Maintainer: Shalygin Konstantin (k0ste@cn.ru)

pkgname='arcconf'
_pkgver='v2_00'
pkgver='2.00'
pkgrel='21811'
pkgdesc='Adaptec command line interface utility'
arch=('i686' 'x86_64')
url=('http://adaptec.com/')
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_pkgver}_${pkgrel}.zip")
sha256sums=('4b4ac5d496172af8a5d9148cfa2ea6337b476dfd51a7585426102551363acaa3')

if [[ "$CARCH" == "i686" ]]; then
package() {
  pushd "$srcdir/linux/cmdline"
  install -Dm755 "arcconf" "$pkgdir/usr/bin/arcconf"
  popd
}
fi

if [[ "$CARCH" == "x86_64" ]]; then
package() {
  pushd "$srcdir/linux_x64/cmdline"
  install -Dm755 "arcconf" "$pkgdir/usr/bin/arcconf"
  popd
}
fi
