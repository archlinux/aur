# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: mawcomw <mawcomw@gmail.com>

pkgname=redmine
pkgver=3.4.6
pkgrel=0
pkgdesc="A flexible project management web application. Written using the Ruby on Rails, it is cross-platform and cross-database."
arch=('any')
url="https://www.redmine.org"
license=('GPL2')
#makedepends=('glibc' 'dialog')
depends=('ruby>=1.9.3')
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
            'rails-ruby: alternative Ruby on Rails instalation')
backup=('usr/share/webapps/redmine/config/configuration.yml'
       'usr/share/webapps/redmine/config/additional_environment.rb'
       'usr/share/webapps/redmine/config/database.yml')
source=("$url/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('ba94cc74620d56faaf9bf211d0f289152df043e4350a93e3f1b29528c053baa1cd36f605fa32c90224cdc62c98b7cfb24cd8cb6a2f988596406993ce86d5aff0')

package() {
  _instdir="$pkgdir"/usr/share/webapps/redmine

  cd "$srcdir"/redmine-$pkgver

  # Install in /usr/share/webapps
  install -dm 644 "$_instdir"
  cp -dr --no-preserve=ownership . "$_instdir"

  # Create required directories
  install -dm 644 "$_instdir"/public/plugin_assets
  install -dm 644 "$_instdir"/tmp/pdf
  install -dm 644 "$_instdir"/files
  install -dm 644 "$_instdir"/log

  # set the http server user:group that will run the application
  #chgrp -R http "$_instdir"
}

