# Maintainer: Thomas Weißschuh <aur t-8ch de>
# Contributor: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen-standalone
pkgver=2.7.0
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

sha256sums=('b0a53fd9fa73e9d87c04ef25ba1ca174b0c062b803108648d7157176ccde7435'
            '3865ce138f0a5f175819d6929203bfbd84377d8d5b7720af59c8cfde2289a2b2'
            'fda89b8383c9df97c007fcf6b7ef045cf357bd660db03400a96ef14996a3d580')
