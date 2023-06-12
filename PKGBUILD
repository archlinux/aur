# Maintainer: timescam <timescam at duck dot com>

pkgname=noto-fonts-emoji-apple
_pkgname=noto-fonts-emoji
pkgver=16.4beta
pkgrel=0
epoch=2
pkgdesc="Google Noto emoji fonts replaced with apple branded emoji, modified form a magisk module"
arch=(any)
url="https://gitlab.com/timescam/noto-fonts-emoji-apple"
provides=(emoji-font)
conflicts=(noto-fonts-emoji)
makedepends=('git')
source=("$_pkgname::git+https://gitlab.com/timescam/noto-fonts-emoji-apple.git")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 "$srcdir/$_pkgname/NotoColorEmoji.ttf" "$pkgdir"/usr/share/fonts/noto

  # Install fontconfig files
  mkdir -p "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir"/$_pkgname/66-noto-color-emoji.conf -t "$pkgdir"/etc/fonts/conf.avail/
  ln -rs "$pkgdir"/etc/fonts/conf.avail/* "$pkgdir"/etc/fonts/conf.d
}

