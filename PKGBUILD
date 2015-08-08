# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname='lbe'
pkgver=2.8.2
pkgrel=3
pkgdesc="Simple Java-based LDAP Browser/Editor (last freeware version)"
arch=('any')
#url="http://www.openchannelsoftware.com/projects/LDAP_Browser_Editor"
url="http://web.archive.org/web/20090201080715/http://mcs.anl.gov/~gawor/ldap/"
license=('custom')
depends=('java-runtime')
source=("http://nullroute.eu.org/mirrors/files/ldapbrowser-$pkgver.zip"
        "lbe.desktop"
        "lbe.sh")
noextract=("ldapbrowser-$pkgver.zip")
sha256sums=('6c1a1b80b81d83f005d4a006bc070b1b8f44f90151f7af6b14004c96e26687ec'
            'ccdc18f2879c6ab10aa0f3ad087a3aa225a6146340be7e2fb46302b961255972'
            '2b1f6f498cc9a00a5b9392b5d162e5425ec63418d930a2e9d96c442f99ed3771')

prepare() {
  unzip -o -d "$srcdir/ldapbrowser-$pkgver" "$srcdir/ldapbrowser-$pkgver.zip"
}

package() {
  mkdir -p "$pkgdir/opt"

  cp -a "$srcdir/ldapbrowser-$pkgver" "$pkgdir/opt/lbe"

  install -Dm755 "$srcdir/lbe.desktop"   "$pkgdir/usr/share/applications/lbe.desktop"
  install -Dm755 "$srcdir/lbe.sh"        "$pkgdir/usr/bin/lbe"
}

# vim: ts=2:sw=2:et
