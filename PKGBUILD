# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=beef-xss-git
pkgver=0.4.7.0
pkgrel=1
pkgdesc="The Browser Exploitation Framework"
arch=('any')
url="http://beefproject.com/"
license=('GPL')
conflicts=('beef-xss-git')
provides=('beef-xss-git' 'sqlite')
prepare() {
           echo Installing needed ruby and rake 
           sudo pacman -S ruby rake sqlite
}

package() {
           git clone https://github.com/beefproject/beef.git
           cd beef          
           gem install bundler
           ~/.gem/ruby/2.3.0/bin/bundle install
           cd ..
           sudo mv -v beef /usr/share/beef
           echo Creating executable for beef-xss...
           sudo mv -v ../beef-xss /usr/bin/beef-xss 
           
}
