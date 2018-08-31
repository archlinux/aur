pkgname=lazyman-plex-git
pkgver=r44.4b1f0da
pkgrel=1
pkgdesc='Lazman Plugin for Plex'
arch=('any')
url='https://github.com/nomego/Lazyman.bundle'
depends=('plex-media-server-plexpass')
source=('git+https://github.com/nomego/Lazyman.bundle.git')
sha512sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd Lazyman.bundle
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  target="$pkgdir/var/lib/plex/Plex Media Server/Plug-ins/Lazyman.bundle"
  install -dm755 "$target"
  cp -dr --no-preserve='ownership' "$srcdir/Lazyman.bundle/Contents" "$target"
  install -Dm755 "$srcdir/Lazyman.bundle/README.md" "$target/README.md"
}
