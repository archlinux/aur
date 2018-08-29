# Maintainer: liberodark

pkgname=guitar
pkgver=0.2.0
pkgrel=1
pkgdesc="Git GUI Client"
arch=('x86_64')
url="https://github.com/soramimi/Guitar/"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("http://files.soramimi.jp/guitar/${pkgver}/Guitar-${pkgver}-debian9-x86-64bit.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('84d4b5d153381924e6623f96b0a089e7726e9c6b55dd294dbb5e295d992c084308974c995df087a154d08ceb6074d2a2d3158270e520e00be7b1be91288d8c62'
         'a731360c2dfbcc74017d0952bad6467d22a23e11d886ad12f18efe96e63e89b0aea76ecc10e5c385fc337191ebe468cf3394c5981f368065d6dab5ddb9723571')
sha512sums_x86_64=('0c4679924ee94d292ff170676e9795717f2da396bed382abac9f8307874b82e7fbc70a942d386b019f919abb2cf06d2ee56deff3c54d448c1dece37c856a41a0')
        
package() {
  cd $srcdir
  tar xvf Guitar-${pkgver}-debian9-x86-64bit.tar.gz
  mkdir -p "$pkgdir/opt/Guitar/"
  rm -r "Guitar/LinuxDesktop"
  cp "Guitar/Guitar" "$pkgdir/opt/Guitar/"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

