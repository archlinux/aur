# Maintainer: <teraflops, cprieto.ortiz@gmail.com>    

pkgname=mympc-git
pkgver=r7.99708e5
pkgrel=3
pkgdesc="An mpc wrapper with music library zsh completion and advanced tagging features."
arch=('any')
url="https://gitlab.com/teraflops/mympc"
license=('MIT')
depends=('zsh' 'mpc' 'mpd' 'python-mpd2' 'bash')
makedepends=('git')
provides=('mympc')
conflicts=('mympc')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/mympc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mympc"
  install -Dm644 "usr/local/share/zsh/site-functions/_mympc" "$pkgdir/usr/local/share/zsh/site-functions/_mympc"
  install -Dm755 "usr/local/bin/mympc" "$pkgdir/usr/local/bin/mympc"
  install -Dm755 "usr/local/share/mympc/get_top_rated_tracks.py" "$pkgdir/usr/local/share/mympc/get_top_rated_tracks.py"
  install -Dm755 "usr/local/share/mympc/add_mood_tag.py" "$pkgdir/usr/local/share/mympc/add_mood_tag.py"
  install -Dm755 "usr/local/share/mympc/tags.sh" "$pkgdir/usr/local/share/mympc/tags.sh"
  install -Dm644 "usr/local/share/mympc/tags.conf" "$pkgdir/usr/local/share/mympc/tags.conf"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


