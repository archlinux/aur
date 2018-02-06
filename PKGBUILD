# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=nextcloud-theme-breeze-dark-git
pkgver=20171112.0d844ac
pkgrel=1
pkgdesc="A Breeze Dark Theme for Nextcloud based on the Breeze Dark theme made by the KDE Project."
arch=(any)
url="https://github.com/mwalbeck/nextcloud-breeze-dark"
license=(AGPL3)
makedepends=(git)
source=(git+https://github.com/mwalbeck/nextcloud-breeze-dark.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/nextcloud-breeze-dark"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  mkdir -p "$pkgdir/usr/share/webapps/nextcloud/themes"
  cp -r "$srcdir/nextcloud-breeze-dark" "$pkgdir/usr/share/webapps/nextcloud/themes"
}
