# Maintainer: Nattgew <nattarchy at gmail dot com>

pkgname=gnome-shell-extension-bitcoin-markets-git
pkgdesc="Displays Bitcoin and Altcoin market information in the Gnome Shell."
pkgver=176.6a12763
pkgrel=6
arch=(any)
url='https://github.com/OttoAllmendinger/gnome-shell-bitcoin-markets/'
license=(MIT)
depends=('gnome-shell')
makedepends=('git' 'zip' 'unzip' 'gjs')
source=('git+https://github.com/OttoAllmendinger/gnome-shell-bitcoin-markets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/gnome-shell-bitcoin-markets
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd "$srcdir"/gnome-shell-bitcoin-markets
    make
    mkdir -p $pkgdir/usr/share/gnome-shell/extensions/bitcoin-markets@ottoallmendinger.github.com
    unzip -q gnome-shell-bitcoin-markets.zip -d $pkgdir/usr/share/gnome-shell/extensions/bitcoin-markets@ottoallmendinger.github.com
    #rm gnome-shell-bitcoin-markets.zip
    #chmod -R 644 $pkgdir/usr/share/gnome-shell/extensions/*
}
