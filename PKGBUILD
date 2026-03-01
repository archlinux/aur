# Maintainer: Renxznm <renxznm@github.com>
pkgname=vid-cli-git
pkgver=r7.82cf8f4
pkgrel=1
pkgdesc="Watching YouTube on a browser is too heavy for my Celeron, so I wrote a minimal bash script as a workaround."
arch=('any')
url="https://github.com/Renxznm/vid-cli"
license=('GPL')
depends=('bash' 'yt-dlp' 'fzf' 'mpv' 'ffmpeg' 'gawk')
makedepends=('git')
provides=("vid-cli")
conflicts=("vid-cli")
source=("git+https://github.com/Renxznm/vid-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 vid-cli "$pkgdir/usr/bin/vid-cli"
}
