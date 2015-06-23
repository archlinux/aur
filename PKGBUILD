# Maintainer: Oleg Plakhotniuk <olegus8@gmail.com>
pkgname=hinance
pkgver=1.0.0
pkgrel=1
pkgdesc="Automated personal bookkeeping for hackers."
arch=('any')
url="http://www.hinance.org"
license=('GPL3')
depends=('haskell-pretty-show' 'haskell-regex-tdfa' 'python2' 'weboob')
makedepends=('git')
source=("git+https://github.com/olegus8/hinance#tag=${pkgver}"
        'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css'
        'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css'
        'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js'
        'https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js')
md5sums=('SKIP'
         '3ab3438f85ad9f9e27e1af1facf0a9c4'
         '95eb835999f0c2f1f3218d46e6c30137'
         '2616d3564578d8f845813483352802a9'
         '8101d596b2b8fa35fe3a634ea342d7c3')

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "${pkgdir}"/usr/{bin,lib/hinance/www}
    ln -s /usr/lib/hinance/hinance-daemon "${pkgdir}"/usr/bin/hinance
    cp -t "${pkgdir}"/usr/lib/hinance/www "$srcdir"/{bootstrap,jquery}*
    cp -r src/* "${pkgdir}"/usr/lib/hinance
}
