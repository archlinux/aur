# Maintainer: Tobias Frilling <tobias@frilling-online.de>

pkgname=leiningen
pkgver=2.6.1
pkgrel=3
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

sha256sums=('9e6a6c7b6e032921a37d5be8fcdc2c0288d3698f759e22bdd29de4eb327ebeab'
            'd70078fba85d5f405d042a6d7bad3a1e5b4aafae565c2d581feb999e95ae6394'
            'SKIP')

