# Maintainer: Lara Maia <lara@craft.net.br>
# Contribuitor: Sagar Chalise <chalisesagar@gmail.com>

pkgname=geany-snippets
pkgver=1
pkgrel=6
pkgdesc="Snippets for Geany"
arch=('any')
url="http://www.geany.org/Download/Extras#snippets"
license=('GPL')
depends=('geany')

source=(ChangeLog
        'tcl.conf::http://advamacs.com/pub/snippets.conf'
        'python.conf::http://download.geany.org/contrib/python_snippets.conf'
        'htmlphp.conf::https://dl.dropboxusercontent.com/u/668529/conf/snippets.conf'
        'latex.conf::http://download.geany.org/contrib/latex_snippets.conf'
        $pkgname.install)
install=$pkgname.install
changelog=ChangeLog
md5sums=('7f3b01c191a525394508a1ecd33387e1'
         '2703567c4b47e3c27404033034829ae7'
         '0fd08ca51cbf862f3fb74c87ea455077'
         'e6c32d7cb454deffe86cb32f62840f34'
         '2dce08133c30e6beca4b5a398dbb0676'
         '2011316bb069109d9fc3dbcfb784a73f')

prepare() {
    cat {tcl,python,htmlphp,latex}.conf > snippets.conf
}

package() {
    install -Dm644 snippets.conf "$pkgdir"/usr/share/geany/snippets.conf.new
}
