# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=leiningen
pkgver=2.5.3
pkgrel=1
epoch=1
pkgdesc="Automating Clojure projects without setting your hair on fire."
arch=('any')
url="http://github.com/technomancy/leiningen"
license=("EPL")
depends=('java-environment' 'bash')
optdepends=('rlwrap: for readline support'
            'leiningen-completions: completion scripts')

_commit="574aabb9d4904fe1d28eda6c735b736433f85f0d"
source=("https://raw.github.com/technomancy/leiningen/$_commit/bin/lein"
        "https://raw.github.com/technomancy/leiningen/$_commit/doc/lein.1")
sha1sums=('c8842f140d85b55cf7ddfca847d51dc9d1a843db'
          '290b634c0648e0710911aeee71f795401af6b2e7')

package() {
  cd ${srcdir}
  install -m 755 -D lein ${pkgdir}/usr/bin/lein
  install -D "${srcdir}"/lein.1 "${pkgdir}"/usr/share/man/man1/lein.1
}
