# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Maintainer: SanskritFritz (gmail)

pkgname=minestein
pkgver=1
pkgrel=10
pkgdesc="A version of the famous Minesweeper game which will always produce puzzles that can be solved using logic."
arch=('i686' 'x86_64')
url="http://sourgumdrop.org.uk/minestein_1.html"
license=('GPL')
depends=('glibc' 'python2' 'tk' )
makedepends=('unzip')
# Home page expired, I include the source directly into the package for the time being:
#source=("http://sourgumdrop.org.uk/pad/Minestein.zip" "$pkgname.desktop")
source=("Minestein.zip" "$pkgname.desktop")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/{bin,share/minestein}
  install -D -m644 \
     Minestein_icon.ico  \
     Minestein_pad_file.xml  \
     Minestein.pyw \
     "$pkgdir/usr/share/minestein"
  echo -e "#!/bin/sh\npython2 /usr/share/minestein/Minestein.pyw" > "$pkgdir/usr/bin/minestein"
  chmod 755 "$pkgdir/usr/bin/minestein"

  install -D -m644 "$srcdir/Minestein_icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('636769163002a521bcf884bd40bc7e73'
         '3a01e2b1acba45e4404a80f6eeac7e89')
