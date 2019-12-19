# Maintainer: syui <syui@users.noreply.github.com>
pkgname=twg
pkgver=0.3
pkgrel=9
pkgdesc="twitter client for CLI"
arch=('x86_64' 'i686')
url="https://github.com/syui/twg"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_386_$pkgname"
  "$url/releases/download/$pkgver/linux_amd64_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('e7202e10d958e1a9ab893fe24765317b18e12609' 'd0de749db19bceb7fbc9212c42e8ecf9a355bc27')
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
  mkdir -p $pkgdir/usr/bin
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  sudo install -Dm755 "$pkgdir/usr/bin/$pkgname" /usr/bin
}

# vim:set ts=2 sw=2 et:
