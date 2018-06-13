# Maintainer: syui <syui@users.noreply.github.com>
pkgname=medigo
pkgver=0.2
pkgrel=1
pkgdesc="Command line client for Medium"
arch=('x86_64' 'i686')
url="https://github.com/syui/medigo"
options=('!strip' '!emptydirs')
license=('MIT')
source=("$url/releases/download/$pkgver/linux_386_$pkgname"
  "$url/releases/download/$pkgver/linux_amd64_$pkgname")
noextract=(${source[@]%%::*})
sha1sums=('3b13d7aa856c184125aaeb8b3f8b89b1b5738600'
  '447ac509ad0c6d37d0313b84d4ab167d1ec1a2aa')

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
  #sudo install -Dm755 "$pkgdir/usr/bin/$pkgname" /usr/bin
}

# vim:set ts=2 sw=2 et:
