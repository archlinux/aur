# Maintainer: syui <syui@users.noreply.github.com>
pkgname=twg
pkgver=0.1
pkgrel=1
pkgdesc="twitter client for CLI"
arch=('x86_64' 'i686')
url="https://github.com/syui/twg"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_386_$pkgname"
  "$url/releases/download/$pkgver/linux_amd64_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('52dcc20fcf2a9031c8a5bed2502060b02e413906'
  'fa1d0b09b3e5241927e547e75770b4f6e4c60096')

package() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  if [ "`uname -m`" = "x86_64" ];then
    mv ../linux_amd64_$pkgname $pkgname 
    chmod +x $pkgname
  fi

  if [ "`uname -m`" = "i684" ];then
    mv ../linux_386_$pkgname $pkgname 
    chmod +x $pkgname
  fi

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  #sudo install -Dm755 "$pkgdir/usr/bin/$pkgname" /usr/bin
}

# vim:set ts=2 sw=2 et:
