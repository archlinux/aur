# Maintainer: Shalygin Konstantin (kostya@opentech.ru)

pkgname='arcconf'
_pkgver='v1_8'
pkgver='1.08'
pkgrel='21375'
pkgdesc='Adaptec command line interface utility'
arch=('i686' 'x86_64')
url=('http://adaptec.com/')
license=('freeware')
source=("http://download.adaptec.com/raid/storage_manager/${pkgname}_${_pkgver}_${pkgrel}.zip")
sha256sums=("ac4991967988ad355c4272df1efcf776db62f0a78ce5b61d065645a1b2e43972")

if [[ "$CARCH" == "i686" ]]; then
package() {
  pushd "$srcdir/linux/cmdline"
  install -Dm755 "arcconf" "$pkgdir/usr/bin/arcconf"
  install -Dm644 "License.txt" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
  install -Dm644 "README.TXT" "$pkgdir/usr/share/doc/$pkgname/README"
  popd
}
fi

if [[ "$CARCH" == "x86_64" ]]; then
package() {
  pushd "$srcdir/linux_x64/cmdline"
  install -Dm755 "arcconf" "$pkgdir/usr/bin/arcconf"
  install -Dm644 "License.txt" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
  install -Dm644 "README.TXT" "$pkgdir/usr/share/doc/$pkgname/README"
  popd
}
fi
