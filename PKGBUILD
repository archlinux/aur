# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname=words-tok
_pkgname=stardict-tok-eng
pkgver=r4.95b0019
pkgrel=1
pkgdesc='wordlist of toki pona words for /usr/share/dict/'
arch=(any)
url="https://git.sr.ht/~anakojm/$_pkgname"
license=('CC-BY-SA-3.0' 'CC-BY-SA-4.0')
makedepends=('git')
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
        cd "$srcdir/$_pkgname"
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package(){
        cd "$srcdir/$_pkgname"
        mkdir -p ${pkgdir}/usr/share/dict/
        awk '{print $1}' toki-pona | sed -e '/^[[:alnum:]]*$/!d' > "${pkgdir}/usr/share/dict/toki-pona"
}
