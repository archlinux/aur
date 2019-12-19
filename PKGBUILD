# Maintainer: syui <syui@users.noreply.github.com>
pkgname=xq
pkgver=0.2
pkgrel=1
pkgdesc="xml to json convert parser"
arch=('x86_64' 'i686')
url="https://github.com/syui/xq"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_386_$pkgname"
  "$url/releases/download/$pkgver/linux_amd64_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('ec49fc225d79473b11790e79d7c1c57b3b829cff'
  '883a2ec0dea0d449b34664367912af289d0b5943')

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
