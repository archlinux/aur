# Maintainer: Marcel Campello <tucho@prafrentex.com.br>
pkgname=leiningen
pkgver=2.9.1
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
sha256sums=('a4c239b407576f94e2fef5bfa107f0d3f97d0b19c253b08860d9609df4ab8b29'
            'ea7c831a4f5c38b6fc3926c6ad32d1d4b9b91bf830a715ecff5a70a18bda55f8')
noextract=("leiningen-${pkgver}-standalone.zip")

package() {
  cd ${srcdir}/leiningen-${pkgver}
  install -m 755 -D bin/lein-pkg ${pkgdir}/usr/bin/lein
  install -D doc/lein.1 ${pkgdir}/usr/share/man/man1/lein.1
  install -D ${srcdir}/leiningen-${pkgver}-standalone.zip \
             ${pkgdir}/usr/share/java/leiningen-${pkgver}-standalone.jar

}
