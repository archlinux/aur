# Maintainer: liberodark

pkgname=cloaker-bin
pkgver=2.1
pkgrel=1
pkgdesc="Simple password-based file encryption"
arch=('x86_64')
url="https://github.com/spieglt/Cloaker"
license=('GPL v3')
depends=('xdg-utils' 'icu60')
source_x86_64=("https://github.com/spieglt/Cloaker/releases/download/${pkgver}/cloakerLinux.zip")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('bc989c7495e71b4f6d0300014a5340db4783a0ce2ea0e6478ceae462836052f3fb7314911a9988f08d72f28ba600473f2e06d6071ebe9f2b7590b1dd69e34781'
         'a230c6328033c09e0b57c303b9231c6af474ccf276dfa773f73595c195ad2d63093b9bad0e4d4273b19fdf33dc0e5fe23b446a1f5c74bde1bd51c2b2b07daaea')
sha512sums_x86_64=('32bf4e4a7539b51598b9d535241533ed7c1254bec7dabbc451f2d2cc3a12d6290a188be08dcc4319d5371bfb7c2efe26c5ead0ee24a66fd3ae0812cdf51d16d5')
        
package() {
  cd $srcdir
  mkdir -p "$pkgdir/opt/cloaker/"
  cp -r "Cloaker.run" "$pkgdir/opt/cloaker/"
  chmod +x "$pkgdir/opt/cloaker/Cloaker.run"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
