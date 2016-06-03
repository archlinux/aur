# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=beef-xss-git
pkgver=0.4.7.0
pkgrel=1
pkgdesc="The Browser Exploitation Framework"
arch=('any')
depends=('ruby' 'rake' 'sqlite')
url="http://beefproject.com/"
license=('GPL')
conflicts=('beef-xss-git')
provides=('beef-xss-git')
source=("https://github.com/beefproject/beef/archive/master.zip")
md5sums=(SKIP)
package() {
           mv -v beef-master "$pkgdir/usr/share/beef-xss"          
           cd $pkgdir/usr/share/beef-xss
           gem install bundler
           ~/.gem/ruby/2.3.0/bin/bundle install
           cd $pkgdir
           mkdir $pkgdir/usr/bin
           echo -e "\e[1;34mCreating executables required to run beef-xss...\e[0m"
           cd $pkgdir
           mv -v ../../beef-xss $pkgdir/usr/bin/beef-xss
           echo -e "\e[1;34mLaunch "beef-xss" for beef and "beef-xss-update" to update beef\e[0m"
}
