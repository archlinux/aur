# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname=stardict-tok-eng
pkgver=1.0.0
pkgrel=1
pkgdesc='toki pona-english dictionary for Stardict'
arch=(any)
url="https://git.sr.ht/~anakojm/$pkgname"
license=('CC-BY-SA-3.0' 'CC-BY-SA-4.0')
source=("$url/refs/download/$pkgver/toki-pona.tar.gz")
sha256sums=("40cc5a1c4c7834b9e8da65619183a59b2db52528a0bda49e75e26625a23d146e")

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
