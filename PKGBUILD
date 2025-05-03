# Submitter: Dallin B
# Maintainer: Dallin B
# Last Packager: Dallin B

pkgbase=blackhole-sim
pkgdesc="A terminal-based black hole orbital simulator with dynamic star orbits"
pkgver=1.1
pkgrel=1
url="https://github.com/art-was-here/blackhole-sim"
arch=('any')
depends=('python')
source=('blackhole.py')
md5sums=('bd1460388e79211246306a689f37f0cc')

pkgname=blackhole-sim

prepare() {
    # Check if the shebang already exists to avoid duplicating it
    if ! grep -q '^#!/usr/bin/env python3' blackhole.py; then
        echo '#!/usr/bin/env python3' | cat - blackhole.py > blackhole.py.tmp
        mv blackhole.py.tmp blackhole.py
    fi
}

package() {
    install -Dm755 blackhole.py "$pkgdir/usr/bin/blackhole"
}