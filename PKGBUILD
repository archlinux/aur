# Maintainer: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen
pkgver=2.7.0
pkgrel=1
epoch=1
pkgdesc="Automating Clojure projects without setting your hair on fire."
arch=('any')
url="https://github.com/technomancy/leiningen"
license=("EPL")
depends=('java-environment' 'bash')
optdepends=('rlwrap: for readline support'
            'leiningen-completions: completion scripts')
install="leiningen.install"

source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.zip"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.zip.asc")
noextract=("leiningen-${pkgver}-standalone.zip")

validpgpkeys=('2E708FB2FCECA07FF8184E275A92E04305696D78')

package() {
  cd ${srcdir}/leiningen-${pkgver}
  install -m 755 -D bin/lein-pkg ${pkgdir}/usr/bin/lein
  install -D doc/lein.1 ${pkgdir}/usr/share/man/man1/lein.1
  install -D ${srcdir}/leiningen-${pkgver}-standalone.zip \
             ${pkgdir}/usr/share/java/leiningen-${pkgver}-standalone.jar

}

sha256sums=('db2069e9a87c72c7f83934e3068dc4b28c688115f7869056c4150392abc54c3d'
            'b0a53fd9fa73e9d87c04ef25ba1ca174b0c062b803108648d7157176ccde7435'
            'SKIP')

