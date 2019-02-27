# Maintainer: Giusy Margarita <kurmikon at libero dot it>

pkgname=acestream-proxy-git
pkgver=1.0
pkgrel=3
pkgdesc="AceProxy new version capable of providing multiple streams of the same channel over HTTP (git version)"
arch=("any")
url="https://github.com/pepsik-kiev/HTTPAceProxy.git"
license=("custom")
depends=("acestream-engine" "python-gevent>=1.3.3" "python-psutil>=5.3.0")
optdepends=('ffmpeg: for stream transcoding and fine tuning yourself')
provides=("aceproxy")
conflicts=("aceproxy")
backup=("opt/aceproxy/aceconfig.py")
source=("$pkgname::git+$url")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  
  cp -r "$srcdir/$pkgname" "$pkgdir/opt/aceproxy"

  ln -s "/opt/aceproxy/acehttp.py" "$pkgdir/usr/bin/aceproxy"
} 
