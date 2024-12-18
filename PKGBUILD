# Experimental Language Server implementation for Eww's configuration lanaguage yuck. 
# https://www.github.com/eugenenoble2005/yuckls
# Maintainer: Noble Eugene <nobleeugene2005@gmail.com> 
pkgname="yuckls-git"
pkgver=1
pkgrel=1
pkgdesc="Experimental Language Server implementation for Eww's configuration language Yuck."
arch=(any)
makedepends=("dotnet-sdk")
depends=("dotnet-runtime")
url="https://www.github.com/eugenenoble2005/yuckls"
source=("git+https://github.com/eugenenoble2005/yuckls")
sha256sums=("SKIP")

package(){
  cd $srcdir/yuckls/YuckLS 
  dotnet build --output dist

  chmod +x ./yuckls 
  chmod +x ./dist/YuckLS

  install -d -m 755 "$pkgdir/usr/bin" && cp yuckls "$pkgdir/usr/bin"

  install -d -m 755 "$pkgdir/usr/lib/yuckls" && cp -r dist/* "$pkgdir/usr/lib/yuckls"

}
