# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor : Stefano Capitani <stefanoatmanjarodotorg>
# Contributor : lemovice <lemovice-at-ancestris-dot-org> 

pkgname="ancestris"
pkgver=12
pkgrel=1
pkgdesc="Unlimited family tree freeware"
url="https://www.ancestris.org"
license=("GPL3")
arch=("any")
optdepends=("java-runtime")
source=("$url/compteur_dl.php?/dl/pub/ancestris/dev/ancestris-latest.zip"
        "ancestris.desktop"
        "ancestris.png")
sha256sums=("SKIP"  # rolling release
            "1f6cba5d8edf2787fd6ed74c84d18dadfcf1969598ea9fe20616da82bf81a07a"
            "70d8af54533990c66543574aff0657383349275464dc9804b15ca94c5e50142d")
options=("!strip")

package(){
 # create missing directories
 install -d -m 755 "$pkgdir/opt" "$pkgdir/usr/share/"{applications,pixmaps}
 # copy program files
 cp -r "ancestris" "$pkgdir/opt"
 # copy desktop entry files
 install -D -m 644 "ancestris.desktop" "$pkgdir/usr/share/applications/ancestris.desktop"
 install -D -m 644 "ancestris.png" "$pkgdir/usr/share/pixmaps/ancestris.png" 
}
