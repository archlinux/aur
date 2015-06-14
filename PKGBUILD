# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=quake3-edawn
pkgver=1.4
pkgrel=1
pkgdesc="A Quake III Arena mod with numerous improvements"
arch=('any')
url="http://edawn-mod.org/"
license=('unknown')
depends=('quake3')
source=("http://edawn-mod.org/binaries/edawn-$pkgver-1.zip")
sha256sums=('c72bcc13fd5f887c59afd42995fb2f6091b16ac4c4f4b41b9745aaa018fe4d34')

package() {
  # Engines other than quake3e may have problems loading files
  # without the .cfg extension
  cd edawn
  for f in {bans,crontab,motd,rotation,voteconf}.txt maps/*.{add,set} ; do
    mv "$f" "$f.cfg"
  done

  cd "$srcdir"
  mkdir -p "$pkgdir/opt/quake3"
  cp -dR edawn "$pkgdir/opt/quake3"
}

# vim:set ts=2 sw=2 et:
