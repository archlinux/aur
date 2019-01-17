# Maintainer: Federico Cuello <fedux@fedux.com.ar>

pkgname=redmine
pkgver=4.0.0
pkgrel=0
pkgdesc="A flexible project management web application written using Ruby on Rails framework."
arch=('any')
url="https://www.redmine.org"
license=('GPL2')
depends=('ruby>=2.2.2')
optdepends=('apache: A supported application server'
            'nginx: A supported application server'
            'mysql: MySQL database support'
            'postgresql: PostgreSQL database support'
            'sqlite: SQLite database support'
            'ruby-rmagick: For Gantt export to PNG image and thumbnails generation'
            'ruby-rails: Alternative Ruby on Rails instalation')
source=("$url/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('8ea38803c03b239b0a617619197fb1c553a7512f7c90acf33ae1b1b605cc2556b402b9f033677bdad4ba4efeb3c18bf3855f749a4d5fb82b07e846b9b0acecde')

package() {
    _instdir="$pkgdir"/usr/share/webapps/redmine

    cd "$srcdir"/redmine-$pkgver

    # Install in /usr/share/webapps
    install -dm 755 "$_instdir"

    # Copy everything but hidden svc dirs and files
    cp -a --no-preserve=ownership ./* "$_instdir"
}
