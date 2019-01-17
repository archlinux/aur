# Maintainer: Federico Cuello <fedux@fedux.com.ar>

pkgname=redmine
pkgver=4.0.0
pkgrel=0
pkgdesc="A flexible project management web application written using Ruby on Rails framework."
arch=('any')
url="https://www.redmine.org"
license=('GPL2')
depends=('ruby>=2.2.2')
optdepends=('rvm: a command line tool to easily manage multiple Ruby environments'
            'rbenv: another command line tool to easily manage multiple Ruby environments'
            'apache: a supported application server'
            'nginx: a supported application server'
            'tomcat7: a supported application server'
            'tomcat8: a supported application server'
            'mariadb: MariaDB database support'
            'mysql: MySQL database support'
            'postgresql: PostgreSQL database support'
            'git: Git repository browsing'
            'subversion: Subversion repository browsing'
            'darcs: Darcs repository browsing'
            'bzr: Bazaar repository browsing'
            'mercurial: Mercurial repository browsing'
            'cvs: CVS repository browsing'
            'imagemagick: Image export support for Gantt'
            'ruby-rails: alternative Ruby on Rails instalation')
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
