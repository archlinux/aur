# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=leiningen
pkgver=2.5.1
pkgrel=1
epoch=1
pkgdesc="Automating Clojure projects without setting your hair on fire."
arch=('any')
url="http://github.com/technomancy/leiningen"
license=("EPL")
depends=('java-environment' 'bash')
optdepends=('rlwrap: for readline support'
            'leiningen-completions: completion scripts')

_commit="27e5e209028af733bdd20e0685b1c4554eb3b26e"
source=("https://raw.github.com/technomancy/leiningen/$_commit/bin/lein"
        "https://raw.github.com/technomancy/leiningen/$_commit/doc/lein.1")
sha1sums=('b59d741e3ad28b3a11ea28eab417133492ca2138'
          '290b634c0648e0710911aeee71f795401af6b2e7')

package() {
  cd ${srcdir}
  install -m 755 -D lein ${pkgdir}/usr/bin/lein
  install -D "${srcdir}"/lein.1 "${pkgdir}"/usr/share/man/man1/lein.1
}
