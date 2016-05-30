# Maintainer: Hythlodaeus <matteodelseppiaomm@gmail.com>
pkgname=beef-xss-git
pkgver=0.4.7.0
pkgrel=1
pkgdesc="The Browser Exploitation Framework"
arch=('any')
url="http://beefproject.com/"
license=('GPL')
conflicts=('beef-xss-git')
provides=('beef-xss-git')
prepare() {
           echo Installing needed ruby, rake and sqlite 
           sudo pacman -S ruby rake sqlite
}

package() {
           git clone https://github.com/beefproject/beef.git
           cd beef          
           gem install bundler
           ~/.gem/ruby/2.3.0/bin/bundle install
           cd ..
           sudo mv -v beef /usr/share/beef
           echo -e "\e[1;34mCreating executables required to run beef-xss...\e[0m"
           sudo mv -v ../beef-xss /usr/bin/beef-xss 
           sudo mv -v ../beef-xss-update /usr/bin/beef-xss-update
           sudo mv -v ../remove-beef /usr/share/beef/remove-beef
           echo -e "\e[1;34mLaunch "beef-xss" for beef and "beef-xss-update" to update beef\e[0m"
}
