# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen-standalone
pkgver=2.5.1
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

sha256sums=('b475c08f505f58f70839195a70a842dcd9b903b70d8447f45a3de06e0c1f34c7'
            '3d3e36aa2429aaaa9b97b5af7b7321dfb1be7699d0f3d88c202728009758185f'
            'fda89b8383c9df97c007fcf6b7ef045cf357bd660db03400a96ef14996a3d580')
