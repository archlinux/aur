# Maintainer:  Tjaart van der walt <aur@tjaart.co.za>

pkgname=gitwatch-git
pkgrel=1
pkgdesc="A bash script to watch a file or folder and commit changes to a git repo"
arch=('any')
url="https://github.com/nevik/gitwatch"
license=('GPL3')
source=(git+https://github.com/nevik/gitwatch.git)
depends=('git' 'inotify-tools')

md5sums=('SKIP')

# I tried to use the pkgver() function, but it returned -1
pkgver=`cd gitwatch; printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"`

package() {
  pwd
  mkdir -p $pkgdir/usr/bin
  cp gitwatch/gitwatch.sh $pkgdir/usr/bin/gitwatch
}
