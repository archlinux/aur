# Maintainer: Thomas Weißschuh <aur t-8ch de>
# Contributor: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen-standalone
pkgver=2.6.1
pkgrel=1
pkgdesc='Automating Clojure projects without setting your hair on fire.  (Standalone version without selfupdates)'
conflicts=('leiningen')
provides=('leiningen')
url='http://github.com/technomancy/leiningen'
arch=('any')
license=('EPL')
depends=('java-environment' 'bash')
optdepends=('rlwrap: for readline support'
            'leiningen-completions: completion scripts')
_ext=zip
source=("https://github.com/technomancy/leiningen/releases/download/${pkgver}/leiningen-${pkgver}-standalone.${_ext}"
        "lein-pkg-${pkgver}::https://raw.githubusercontent.com/technomancy/leiningen/${pkgver}/bin/lein-pkg"
        "lein.1-${pkgver}::https://raw.githubusercontent.com/technomancy/leiningen/${pkgver}/doc/lein.1")
noextract=("leiningen-${pkgver}-standalone.${_ext}")

package () {
        install -m 755 -D lein-pkg-${pkgver} ${pkgdir}/usr/bin/lein
        install -D lein.1-${pkgver} "${pkgdir}"/usr/share/man/man1/lein.1
        install -D leiningen-${pkgver}-standalone.${_ext} \
                "${pkgdir}"/usr/share/java/leiningen-${pkgver}-standalone.jar
}

sha256sums=('d70078fba85d5f405d042a6d7bad3a1e5b4aafae565c2d581feb999e95ae6394'
            'e84d15b45871fdb0308fec85786d6df8aefcc51482efa299086aad6706cdb1d9'
            'fda89b8383c9df97c007fcf6b7ef045cf357bd660db03400a96ef14996a3d580')
