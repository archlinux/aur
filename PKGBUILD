# Maintainer: syui <syui@users.noreply.github.com>
pkgname=xq
pkgver=0.3.3
pkgrel=1
pkgdesc="xml to json convert parser"
arch=('x86_64' 'i686')
url="https://github.com/syui/xq"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_386_$pkgname"
  "$url/releases/download/$pkgver/linux_amd64_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('c47fa451d0f9f24a174f152a927d095b0cd3dde6'
  'a92b5523373e8d2f0ca8da1974f7be8eb0fb75e1')

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
