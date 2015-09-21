# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen-standalone
pkgver=2.5.2
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

sha256sums=('64c70202dc7989de1b9d8b8b9b99e87dbb7698338e24d25722777412e37e1b62'
            'f16473c1a41815a3dac1f0c8ca8ec1d33c30a243d20e1e50b2db96300a31fa5f'
            'fda89b8383c9df97c007fcf6b7ef045cf357bd660db03400a96ef14996a3d580')
