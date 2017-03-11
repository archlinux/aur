# Maintainer: Marcel Campello <tucho@prafrentex.com.br>
pkgname=leiningen
pkgver=2.7.1
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
sha256sums=('953c95c2656c46320c88dc683202030fdd9554e8390a4b4aaaba6d019088df6f'
            '2ddc7e89bbb45cf1ca3d666a10dce0d3f154b77ad201aa58f430e84e71587c47')
noextract=("leiningen-${pkgver}-standalone.zip")

package() {
  cd ${srcdir}/leiningen-${pkgver}
  install -m 755 -D bin/lein-pkg ${pkgdir}/usr/bin/lein
  install -D doc/lein.1 ${pkgdir}/usr/share/man/man1/lein.1
  install -D ${srcdir}/leiningen-${pkgver}-standalone.zip \
             ${pkgdir}/usr/share/java/leiningen-${pkgver}-standalone.jar

}
