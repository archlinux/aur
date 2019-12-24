# Maintainer: syui <syui@users.noreply.github.com>
pkgname=xq
pkgver=0.3.0
pkgrel=1
pkgdesc="xml to json convert parser"
arch=('x86_64' 'i686')
url="https://github.com/syui/xq"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_386_$pkgname"
  "$url/releases/download/$pkgver/linux_amd64_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('5cf3d5dc13bde112c9c771ef93f3916bdebfc726'
  '9a2750a783c2a2b3b38e8920bc5beafc8d2a4299')

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
