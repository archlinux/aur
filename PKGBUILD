# Maintainer: Marcel Campello <tucho@prafrentex.com.br>
pkgname=leiningen
pkgver=2.8.3
pkgrel=1
pkgdesc="Automating Clojure projects without setting your hair on fire."
arch=('any')
url="https://github.com/technomancy/leiningen"
license=("EPL")
depends=('java-environment' 'bash')
optdepends=('rlwrap: for readline support'
            'leiningen-completions: completion scripts')
install="leiningen.install"

source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.zip")
sha256sums=('adabd2f0412a507ef0dbbcf59e91f6aa0a8b0de0348b98d7b2c63a80a0a37024'
            '7f0aafc93b1e32e49b7b15beaeefdbd6521dabb3cdbe541225e2524a503b6b1e')
noextract=("leiningen-${pkgver}-standalone.zip")

package() {
  cd ${srcdir}/leiningen-${pkgver}
  install -m 755 -D bin/lein-pkg ${pkgdir}/usr/bin/lein
  install -D doc/lein.1 ${pkgdir}/usr/share/man/man1/lein.1
  install -D ${srcdir}/leiningen-${pkgver}-standalone.zip \
             ${pkgdir}/usr/share/java/leiningen-${pkgver}-standalone.jar

}
