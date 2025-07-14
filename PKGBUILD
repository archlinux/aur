# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname=stardict-tok-eng
pkgver=2.0.0
pkgrel=1
pkgdesc='toki pona-english dictionary for Stardict'
arch=(any)
url="https://git.sr.ht/~anakojm/$pkgname"
license=('CC-BY-SA-3.0' 'CC-BY-SA-4.0')
source=("$url/refs/download/$pkgver/toki-pona.tar.gz")
sha256sums=("6d58b18a5eb4bdf0215971372dc6aefbec2385f7c0529a0a42326ce96e1f8b1f")

package(){
        cd "$srcdir"

        if test -n "$STARDICT_DATA_DIR"; then
                mkdir -p "${pkgdir}/$STARDICT_DATA_DIR/dic/toki-pona/"
                install -m644 -D toki-pona.idx "${pkgdir}/$STARDICT_DATA_DIR/dic/toki-pona/"
                install -m644 -D toki-pona.ifo "${pkgdir}/$STARDICT_DATA_DIR/dic/toki-pona/"
                install -m644 -D toki-pona.dict.dz "${pkgdir}/$STARDICT_DATA_DIR/dic/toki-pona/"
        else
                mkdir -p "${pkgdir}/usr/share/stardict/dic/toki-pona/"
                install -m644 -D toki-pona.idx "${pkgdir}/usr/share/stardict/dic/toki-pona/"
                install -m644 -D toki-pona.ifo "${pkgdir}/usr/share/stardict/dic/toki-pona/"
                install -m644 -D toki-pona.dict.dz "${pkgdir}/usr/share/stardict/dic/toki-pona/"
        fi
}
