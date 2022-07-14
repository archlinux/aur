# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
pkgbase=passenger-pm-bin
pkgname=passenger-pm-bin
pkgver=1.0
pkgrel=1
pkgdesc="Built version of Passenger with secret algorithm. Use opensource for your algorithm."
arch=('x86_64')
url="https://github.com/Elagoht/Passenger"
license=('GPL')
optdepends=('git: sync passwords with git repo')
source=("PassengerLinuxInstaller.tar.gz::https://github.com/Elagoht/Passenger/releases/download/v$pkgver/PassengerLinuxInstaller.tar.gz")
sha256sums=('610f1cc3adbbf6ef68d510ac719eaeb0d3a2a685ae951752865fb323b21cd0c2')
pkgver() {
  printf "$pkgver"
}
package() {
   sed -i "s/Exec\=passenger/Exec\=\/usr\/share\/Passenger\/Passenger/" Passenger.desktop 
   cp -fv "Passenger.app" "Passenger/Passenger"
   install -d "$pkgdir/usr/share/applications"
   cp -vr "Passenger" "$pkgdir/usr/share"
   install -Dm644 "Passenger.desktop" -t "$pkgdir/usr/share/applications"
   rm -r *
}
