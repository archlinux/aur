# Maintainer: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen
pkgver=2.6.1
pkgrel=2
epoch=1
pkgdesc="Automating Clojure projects without setting your hair on fire."
arch=('any')
url="https://github.com/technomancy/leiningen"
license=("EPL")
depends=('java-environment' 'bash')
optdepends=('rlwrap: for readline support'
            'leiningen-completions: completion scripts')
install="leiningen.install"

_commit="f9a464e008214941e93c046413004517325818bb"
source=("https://raw.github.com/technomancy/leiningen/${_commit}/bin/lein-pkg"
        "https://raw.github.com/technomancy/leiningen/${_commit}/doc/lein.1"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.zip"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.zip.asc")
noextract=("leiningen-${pkgver}-standalone.zip")

package() {
  cd ${srcdir}
  install -m 755 -D lein-pkg ${pkgdir}/usr/bin/lein
  install -D lein.1 ${pkgdir}/usr/share/man/man1/lein.1
  install -D leiningen-${pkgver}-standalone.zip \
             ${pkgdir}/usr/share/java/leiningen-${pkgver}-standalone.jar

}

sha256sums=('e84d15b45871fdb0308fec85786d6df8aefcc51482efa299086aad6706cdb1d9'
            'fda89b8383c9df97c007fcf6b7ef045cf357bd660db03400a96ef14996a3d580'
            'd70078fba85d5f405d042a6d7bad3a1e5b4aafae565c2d581feb999e95ae6394'
            'SKIP')
