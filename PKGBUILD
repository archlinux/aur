# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgname=('eiskaltdcpp-web-git')
pkgver=1.0.r12.e06fa80
pkgrel=1
pkgdesc="Web interface for EiskaltDC++ Daemon. (GIT Version)"
license=('GPL3')
arch=('any')
url='https://github.com/eiskaltdcpp/eiskaltdcpp-web'
makedepends=('git')
depends=('eiskaltdcpp-daemon')
provides=('eiskaltdcpp-web')
conflicts=('eiskaltdcpp-web')
options=('!emptydirs')
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp-web'
        'jquery.js::https://code.jquery.com/jquery-1.12.4.js'
        'jquery.easytabs.js::https://raw.github.com/JangoSteve/jQuery-EasyTabs/v3.2.0/lib/jquery.easytabs.js'
        'jquery.hashchange.js::https://raw.github.com/pandell/jquery-hashchange/v1.3c/jquery.ba-hashchange.js'
        'jquery.jsonrpc.js::http://raw.github.com/datagraph/jquery-jsonrpc/0.1.1/jquery.jsonrpc.js'
        'jquery.plugin.js::http://raw.github.com/Cyntax/jquery-timer/0.1.1/jquery.plugin.js'
        'jquery.timer.js::http://raw.github.com/Cyntax/jquery-timer/0.1.1/jquery.timer.js'
        'jquery.tablesorter.js::https://raw.github.com/Mottie/tablesorter/v2.29.0/dist/js/jquery.tablesorter.js'
        'require.js::http://requirejs.org/docs/release/2.3.5/comments/require.js'
        )
sha256sums=('SKIP'
            '430f36f9b5f21aae8cc9dca6a81c4d3d84da5175eaedcf2fdc2c226302cb3575'
            '5e0da05d396bc6e39c82e524b19aa8357125f68dd2553d453099498572044f10'
            '35a7d71dfcd3f699145ae40b2521f1650052376ddd4126e4234dd98483e0ef8b'
            '54afeb1872a56d9057655b1f7276048d225751b24b95bbc2e68827ba3d6c87f9'
            '39ff6a891680714e2e33453246d22ccd42d364fb6cbb5d11c5ec7360259e6ed3'
            'b3b14d084610ee20a770f30e6379872cc05c00b0df6260a4627aff7430253db6'
            'b1ead7be16de10a75021f4c5483df0a4d086371dbeffda72ed55dfc0b8584df9'
            'baf9f8d5534f43c695340e9a4b56637361543e42aaed9800e92cc5887915831b'
            )
backcup=('usr/share/webapps/Eiskaltdcpp-web/config.js')

pkgver() {
  cd eiskaltdcpp-web
  echo "1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  _lib=('jquery.js'
        'jquery.easytabs.js'
        'jquery.hashchange.js'
        'jquery.jsonrpc.js'
        'jquery.plugin.js'
        'jquery.timer.js'
        'jquery.tablesorter.js'
        'require.js'
        )
  for i in "${_lib[@]}"; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/webapps/Eiskaltdcpp-web/js/lib/${i}"
  done
  cd eiskaltdcpp-web

  find . -type f ! -name 'get-js-dependecies.sh' -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/Eiskaltdcpp-web/"{} \;

}
