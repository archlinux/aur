# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=tile-world
pkgver=1.3.2
pkgrel=1
pkgdesc="Emulation of the game Chip's Challenge"
arch=('i686' 'x86_64')
url="http://www.muppetlabs.com/~breadbox/software/tworld/"
license=('GPL')
depends=('sdl')
source=("http://www.muppetlabs.com/~breadbox/pub/software/tworld/tworld-$pkgver.tar.gz")
md5sums=('d12e84f14f206068a1a4a025b07bb825')

build() {
  cd "$srcdir"/tworld-$pkgver

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
  
  make
}
  
package() {
  cd "$srcdir"/tworld-$pkgver

  install -dm755 "$pkgdir"/usr/{bin,share/{tworld,man/man6}}
  install -dm755 "$pkgdir"/usr/share/tworld/{sets,data,res}
  install -m755 tworld "$pkgdir"/usr/bin
  install -m644 sets/*.dac "$pkgdir"/usr/share/tworld/sets
  install -m644 data/*.dat "$pkgdir"/usr/share/tworld/data
  install -m644 res/{rc,*.bmp,*.txt,*.wav} "$pkgdir"/usr/share/tworld/res
  install -m644 docs/tworld.6 "$pkgdir"/usr/share/man/man6
}

# vim:set ts=2 sw=2 et:
